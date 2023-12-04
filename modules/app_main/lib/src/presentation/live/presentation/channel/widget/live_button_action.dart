import 'package:flutter/material.dart';

class LiveButtonAction extends StatelessWidget {
  const LiveButtonAction({
    super.key,
    this.bgColor,
    required this.icon,
    this.onPressed,
  });

  final Color? bgColor;
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor ?? const Color(0xff101010).withOpacity(0.2),
        ),
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
