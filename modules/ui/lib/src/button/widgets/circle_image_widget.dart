import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class CircleImageWidget extends StatelessWidget {
  final double radius;
  final String? image;
  final Color? color;

  const CircleImageWidget(
    this.image, {
    super.key,
    required this.radius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color ?? const Color(0xffEAF2FF),
      ),
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(right: 5),
      child: ImageWidget(image!),
    );
  }
}
