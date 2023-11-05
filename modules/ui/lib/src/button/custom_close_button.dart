import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final Color? color;
  final Alignment? alignment;
  final Function()? onPressed;
  const CustomCloseButton(
      {super.key, this.color, this.alignment, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed ??
          () => Navigator.of(context).popUntil((route) => route.isFirst),
      alignment: alignment ?? Alignment.centerRight,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Icon(Icons.close, color: color),
    );
  }
}
