import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double? width;

  const CommonButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = const Color(0xFF4B84F7),
    this.textColor = Colors.white,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed.call,
        child: Text(
          title,
          style: context.text.bodyLarge?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 24 / 16,
          ),
        ),
      ),
    );
  }
}
