import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BoxSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  const BoxSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.highlightColor,
    this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: baseColor ?? const Color(0xffF3F7F9),
        highlightColor: highlightColor ?? const Color(0xffF3F7F9).withOpacity(0.4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}