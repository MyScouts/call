import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class SelectInformationWidget<T> extends StatelessWidget {
  final List<T>? items;
  final Widget Function(T)? builder;
  final String? currentValue;
  final Function(T?)? onChanged;
  final UpdateInformationType type;
  final VoidCallback? onTapBody;
  final bool required;
  final String? Function(T? value)? validator;
  final AutovalidateMode autovalidateMode;

  const SelectInformationWidget({
    super.key,
    this.items,
    this.builder,
    this.currentValue,
    this.onChanged,
    this.onTapBody,
    required this.type,
    this.required = false,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
        autovalidateMode: autovalidateMode,
        validator: validator,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelFieldWidget(
                text: type.title(context),
                required: required,
              ),
              onTapBody != null
                  ? GestureDetector(
                      onTap: onTapBody,
                      child: _renderView(context, state.hasError),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownMenuButton<T>(
                          builder: builder!,
                          onChanged: (value) {
                            // ignore: invalid_use_of_protected_member
                            state.setValue(value);
                            state.validate();
                            if (value != null && value != currentValue) {
                              onChanged?.call(value);
                            }
                          },
                          items: items!,
                          customButton: _renderView(context, state.hasError),
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '${state.errorText}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 13,
                              ),
                            ),
                          ),
                      ],
                    ),
            ],
          );
        });
  }

  Widget _renderView(BuildContext context, bool hasError) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: hasError
                ? Theme.of(context).colorScheme.error
                : AppColors.grey10),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currentValue ?? type.hintText(),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: currentValue == null ? AppColors.grey10 : null),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 18)
        ],
      ),
    );
  }
}
