import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final Alignment? alignment;
  final Function()? onPressed;
  const CustomBackButton({
    super.key,
    this.color,
    this.alignment,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed ?? () => Navigator.pop(context),
      alignment: alignment ?? Alignment.centerLeft,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: ImageWidget(
        IconAppConstants.icArrowLeft,
        color: color ?? AppColors.black,
      ),
    );
  }
}
