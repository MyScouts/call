import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformLoadingIndicator extends StatelessWidget {
  const PlatformLoadingIndicator({
    super.key,
    this.size = 20,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        radius: size * 0.5,
        color: color,
      );
    }

    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: size * 0.1,
      ),
    );
  }
}