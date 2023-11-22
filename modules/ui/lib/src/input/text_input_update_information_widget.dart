// ignore_for_file: lines_longer_than_80_chars

import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/text_input_layout.dart';

class TextInputUpdateInformationWidget extends StatefulWidget {
  const TextInputUpdateInformationWidget({
    super.key,
    this.controller,
    this.onChanged,
    required this.type,
    this.textInputAction,
    this.shouldEnabled = true,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffixText,
    this.focusController,
    this.maxLength,
    this.inputFormatters,
    this.showCounterText = false,
  });

  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged;
  final UpdateInformationType type;
  final TextInputAction? textInputAction;
  final bool shouldEnabled;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String? value)? validator;
  final String? suffixText;
  final ValueNotifier<bool>? focusController;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool showCounterText;

  @override
  State<TextInputUpdateInformationWidget> createState() =>
      _TextInputUpdateInformationWidgetState();
}

class _TextInputUpdateInformationWidgetState
    extends State<TextInputUpdateInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return TextInputLayout(
      textCapitalization: TextCapitalization.sentences,
      maxLength: widget.maxLength,
      controller: widget.controller,
      onChanged: widget.onChanged,
      focusController: widget.focusController,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      hintText: widget.hintText,
      validator: widget.validator,
      enabled: widget.shouldEnabled,
      inputFormatters: widget.inputFormatters,
      showCounterText: widget.showCounterText,
      border: Theme.of(context).themeDecoration.textInputBorderSocial.copyWith(
            borderSide: const BorderSide(
              color: AppColors.grey10,
            ),
          ),
      disableColor: AppColors.grey70,
      fillColor: Colors.white,
      focusedBorder:
          Theme.of(context).themeDecoration.textInputBorderSocial.copyWith(
                borderSide: const BorderSide(
                  color: AppColors.blue10,
                ),
              ),
      paddingError: const EdgeInsets.only(left: 0),
      suffixText: widget.suffixText,
    );
  }
}
