import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'infomation_layout_field_widget.dart';
import 'text_input_update_information_widget.dart';

class InformationFieldWidget extends StatelessWidget {
  final UpdateInformationType type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final String? suffixText;
  final String? hintText;
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
    this.suffixText,
    required this.onChanged,
    this.focusController,
    this.required = false,
    this.isBold = false,
    this.maxLength,
    this.shouldEnabled = true,
    this.inputFormatters,
    this.showCounterText = false,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return InformationLayoutFieldWidget(
      label: type.title(context),
      required: required,
      isBold: isBold,
      child: TextInputUpdateInformationWidget(
          type: type,
          controller: controller,
          hintText: hintText ?? type.hintText(),
          validator: validator,
          textInputType: textInputType,
          suffixText: suffixText,
          onChanged: onChanged,
          maxLength: maxLength,
          focusController: focusController,
          textInputAction: TextInputAction.next,
          shouldEnabled: shouldEnabled,
          inputFormatters: inputFormatters,
          showCounterText: showCounterText),
    );
  }
}
