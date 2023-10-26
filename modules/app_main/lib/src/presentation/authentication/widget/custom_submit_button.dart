import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    this.backgroundColor,
    this.gradientBackgroundColor,
    this.width,
    this.height,
    this.prefix,
    this.isLoading = false,
  });
  final String title;
  final Function()? onTap;
  final Color color;
  final Color? backgroundColor;
  final Gradient? gradientBackgroundColor;
  final double? width;
  final double? height;
  final Widget? prefix;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? maxWidth,
        height: height ?? 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
          gradient: backgroundColor != null ? null : gradientBackgroundColor,
        ),
        child: isLoading
          ? const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
          : Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefix != null)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: prefix,
                  ),
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}