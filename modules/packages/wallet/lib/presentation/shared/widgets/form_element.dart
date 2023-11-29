import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../core/core.dart';
import '../../wallet_constant.dart';

class FormElement extends StatefulWidget {
  final String? title;
  final bool isRequired;
  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final String name;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool enable;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color enableBorderColor;
  final Color focusedBorderColor;
  final bool filled;
  final BorderRadius? borderRadius;
  final TextInputType? keyBoardType;
  final ValueTransformer<String?>? valueTransformer;
  final List<TextInputFormatter>? inputFormatters;
  final GestureTapCallback? onTap;

  final Widget? action;
  final Color? color;

  const FormElement({
    super.key,
    this.title,
    this.isRequired = true,
    required this.name,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.validator,
    this.enable = true,
    this.suffixIcon,
    this.prefixIcon,
    this.enableBorderColor = WalletTheme.transparent,
    this.focusedBorderColor = WalletTheme.transparent,
    this.filled = true,
    this.borderRadius,
    this.keyBoardType = TextInputType.text,
    this.action,
    this.color,
    this.valueTransformer,
    this.inputFormatters,
    this.onTap,
  });

  @override
  State<FormElement> createState() => _FormElementState();
}

class _FormElementState extends State<FormElement> {
  late final BorderRadius borderRadius;

  @override
  void initState() {
    borderRadius = widget.borderRadius ?? WalletConstant.borderRadius12;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: WalletTheme.grey74,
          ),
          errorStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: WalletTheme.red,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red36,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red36,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: WalletTheme.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: widget.enableBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.focusedBorderColor),
            borderRadius: borderRadius,
          ),
          filled: widget.filled,
          fillColor: widget.color ?? AppColors.grey12,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RichText(
                  text: TextSpan(
                    text: widget.title,
                    style: context.text.titleMedium?.copyWith(
                      color: const Color(0xFF212121),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 20 / 14,
                    ),
                    children: [
                      if (widget.isRequired)
                        const TextSpan(
                          text: ' *',
                          style:
                              TextStyle(color: AppColors.red20, fontSize: 16),
                        ),
                    ],
                  ),
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: widget.name,
                    controller: widget.controller,
                    initialValue: widget.initialValue,
                    onChanged: widget.onChanged,
                    keyboardAppearance: Brightness.light,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 16),
                    onTap: widget.onTap,
                    decoration: InputDecoration(
                      errorMaxLines: 2,
                      hintText: widget.hintText,
                      enabled: widget.enable,
                      suffixIcon: widget.suffixIcon,
                      prefixIcon: widget.prefixIcon,
                    ),
                    keyboardType: widget.keyBoardType,
                    validator: widget.validator,
                    valueTransformer: widget.valueTransformer,
                    inputFormatters: widget.inputFormatters,
                  ),
                ),
                if (widget.action != null) const SizedBox(width: 10),
                if (widget.action != null) widget.action!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
