import 'package:flutter/material.dart';

import 'checkbox_widget.dart';
import 'group_check_box_widget.dart';

class CheckboxFormField<T> extends FormField<T> {
  CheckboxFormField({
    Key? key,
    required Set<T> values,
    T? initialValue,
    int? numberOfRow,
    FormFieldValidator<T>? validator,
    ValueChanged<T?>? onSelected,
    double spacing = 8.0,
    bool isRadioType = false,
    bool autovalidate = false,
    CheckboxBuilder? checkBoxbuilder,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(
            key: key,
            validator: validator,
            autovalidateMode: autovalidateMode,
            initialValue: initialValue,
            builder: (FormFieldState<T> state) {
              return GroupCheckBoxWidget<T>(
                defaultValue: initialValue,
                values: values,
                numberOfRow: numberOfRow,
                isRadioType: isRadioType,
                checkBoxbuilder: checkBoxbuilder,
                onSelected: (T? value) {
                  onSelected?.call(value);
                  // ignore: invalid_use_of_protected_member
                  state.setValue(value);
                  state.validate();
                },
                spacing: spacing,
                error: state.hasError && (state.errorText?.isNotEmpty ?? false)
                    ? Builder(
                        builder: (BuildContext context) => Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            state.errorText!,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    : null,
              );
            });
}
