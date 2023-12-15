import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PrimarySolidButton extends StatelessWidget {
  const PrimarySolidButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    required this.disabled,
    this.backgroundColor,
    required this.width,
    this.height,
    this.prefix,
    this.isLoading = false,
    this.textColor,
  });
  final String title;
  final Function()? onTap;
  final Color? color;
  final Color? textColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Widget? prefix;
  final bool isLoading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || disabled ? null : onTap,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height ?? 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (color ?? context.theme.primaryColor)
                  .withOpacity(disabled ? .2 : 1),
            ),
            child: Center(
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
                    style: context.text.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: disabled
                          ? AppColors.grey72
                          : (textColor ?? AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            const Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
