import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onTap,
    this.isGradientColor = false,
    this.backgroundColor,
    this.width,
    this.textColor,
    this.textStyle,
    this.gradientColors,
    super.key,
  });
  final bool isGradientColor;
  final List<Color>? gradientColors;
  final Color? backgroundColor;
  final double? width;
  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          gradient: isGradientColor
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: gradientColors ??
                      <Color>[
                        AppColors.blue36,
                        AppColors.blue37,
                      ],
                )
              : null,
          color: backgroundColor ?? AppColors.blueEdit,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.w,
          horizontal: width == null ? 12.w : 0,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: textColor ?? AppColors.white,
              ),
        ),
      ),
    );
  }
}
