import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../../../shared/extensions/validation_extension.dart';

class InformationLayoutTextInputWidget extends StatelessWidget {
  const InformationLayoutTextInputWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.minLines,
    this.maxLines,
    required this.errMsg,
    required this.controller,
    required this.onChanged,
  });

  final String label;
  final String hintText;
  final int? minLines;
  final int? maxLines;
  final String errMsg;
  final TextEditingController controller;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return InformationLayoutFieldWidget(
      label: label,
      required: true,
      child: TextInputLayout(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        minLines: minLines,
        maxLines: maxLines ?? 1,
        hintText: hintText,
        onChanged: onChanged,
        validator: (value) =>
            context.validateEmptyInfo(controller.text, errMsg),
        focusedBorder: Theme.of(context)
            .themeDecoration
            .textInputBorderSocial
            .copyWith(borderSide: const BorderSide(color: AppColors.blue10)),
        paddingError: const EdgeInsets.only(left: 0),
      ),
    );
  }
}
