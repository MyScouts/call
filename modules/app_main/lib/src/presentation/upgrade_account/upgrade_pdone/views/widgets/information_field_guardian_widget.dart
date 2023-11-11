import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/ui.dart';

class InformationFieldGuardianWidget extends StatelessWidget {
  final UpdateInformationType type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final String? suffixText;
  final ValueChanged<String?> onChanged;
  final ValueNotifier<bool>? focusController;
  final bool required;
  final bool isBold;
  final int? maxLength;
  final bool shouldEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool showCounterText;

  const InformationFieldGuardianWidget({
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
          hintText: type.hintText(),
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