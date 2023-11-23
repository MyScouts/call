import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

import 'text_input_search.dart';
import 'widgets/label_field_widget.dart';

class SearchInputInformationWidget<T> extends StatelessWidget {
  final List<T>? items;
  final SuggestionsField<T>? initialValue;

  final UpdateInformationType? type;
  final ValueChanged<String?>? onChanged;
  final List<SuggestionsField<T>> suggestions;
  final void Function(T?)? onSelected;
  final String? Function(String?)? validator;
  final ValueNotifier<bool>? focusController;
  final TextEditingController? controller;
  final bool required;
  final int maxSuggestionsInViewPort;
  final bool enabled;

  const SearchInputInformationWidget({
    super.key,
    this.items,
    this.initialValue,
    this.onChanged,
    this.type,
    required this.suggestions,
    this.onSelected,
    this.validator,
    this.focusController,
    this.controller,
    this.required = false,
    this.maxSuggestionsInViewPort = 10,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(type != null)LabelFieldWidget(
          text: type?.title(context) ?? '',
          required: required,
        ),
        TextFieldSearch<T>(
          radius: 8,
          enabled: enabled,
          hintText: type?.title(context),
          focusController: focusController,
          suggestions: suggestions,
          contentPadding: const EdgeInsets.fromLTRB(14, 14, 32, 14),
          onChanged: onChanged,
          onSelected: onSelected,
          validator: validator,
          controller: controller,
          initialValue: initialValue,
          maxSuggestionsInViewPort: maxSuggestionsInViewPort,
        ),
      ],
    );
  }
}
