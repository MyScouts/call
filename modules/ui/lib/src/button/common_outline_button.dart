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
    Key? key,
    required this.onPressed,
    this.child,
    this.borderRadius,
    this.width,
    this.height = 48.0,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.blue10, width: 1),
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
