import 'package:flutter/material.dart';

import '../../ui.dart';


class InfomationLayoutFieldWidget extends StatelessWidget {
  const InfomationLayoutFieldWidget({
    super.key,
    required this.child,
    required this.label,
    this.required = false,
    this.isBold = false,
  });

  final Widget child;
  final String label;
  final bool required;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelFieldWidget(
          text: label,
          required: required,
          isBold: isBold,
        ),
        child,
      ],
    );
  }
}
