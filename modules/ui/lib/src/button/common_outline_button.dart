import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CommonOutlineButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback onPressed;
  final Widget? child;
  final String? label;

  const CommonOutlineButton({
    super.key,
    required this.onPressed,
    this.child,
    this.borderRadius,
    this.width,
    this.height = 48.0,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.blue10, width: 2),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              '$label',
              style: context.text.bodyLarge?.copyWith(
                color: AppColors.blue10,
              ),
            ),
      ),
    );
  }
}
