import 'package:app_core/app_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCircleIndicator extends StatelessWidget {
  const AppCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return isAndroid
        ? const CircularProgressIndicator()
        : const CupertinoActivityIndicator();
  }
}
