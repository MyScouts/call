import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_input_update_information_widget.dart';
import 'widgets/label_field_widget.dart';

class InformationFieldWidget extends StatelessWidget {
  final UpdateInformationType type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final ValueChanged<String?> onChanged;
  final ValueNotifier<bool>? focusController;
  final bool required;
  final bool isBold;
  final int? maxLength;
  final bool shouldEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool showCounterText;

  const InformationFieldWidget({
    super.key,
    required this.type,
    this.controller,
    this.validator,
    this.textInputType = TextInputType.text,
    required this.onChanged,
    this.focusController,
    this.required = false,
    this.isBold = false,
    this.maxLength,
    this.shouldEnabled = true,
    this.inputFormatters,
    this.showCounterText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelFieldWidget(
          text: type.title(context),
          required: required,
          isBold: isBold,
        ),
        TextInputUpdateInformationWidget(
          type: type,
          controller: controller,
          hintText: type.hintText(),
          validator: validator,
          textInputType: textInputType,
          onChanged: onChanged,
          maxLength: maxLength,
          focusController: focusController,
          textInputAction: TextInputAction.next,
          shouldEnabled: shouldEnabled,
          inputFormatters: inputFormatters,
          showCounterText: showCounterText,
        ),
      ],
    );
  }
}
