import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.width,
    this.height,
    this.padding,
  });

  final String icon;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: padding,
            width: width,
            height: height,
            child: ImageWidget(icon),
          ),
        ],
      ),
    );
  }
}
