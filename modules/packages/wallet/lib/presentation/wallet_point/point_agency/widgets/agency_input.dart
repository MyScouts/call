import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/ui.dart';

enum AgencyInputEnum {
  userId,
}

extension UpdateInformationTypeExt on AgencyInputEnum {
  String title(BuildContext context) {
    switch (this) {
      case AgencyInputEnum.userId:
        return 'ID NGƯỜI NHẬN';
    }
  }

  String hintText() {
    switch (this) {
      case AgencyInputEnum.userId:
        return 'Nhập ID người nhận';
    }
  }
}

class AgencyInputTextField extends StatelessWidget {
  final AgencyInputEnum type;
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

  const AgencyInputTextField({
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
      child: AgencyTextInput(
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

class AgencyTextInput extends StatefulWidget {
  const AgencyTextInput({
    super.key,
    this.controller,
    this.onChanged,
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
  State<AgencyTextInput> createState() => _AgencyTextInputState();
}

class _AgencyTextInputState extends State<AgencyTextInput> {
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
