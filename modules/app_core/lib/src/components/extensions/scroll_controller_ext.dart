import 'package:flutter/material.dart';

extension ScrollControllerExt on ScrollController {
  void scrollToTopOrRefresh([bool isPullToRefresh = true]) {
    if (position.extentBefore == 0 && isPullToRefresh) {
      animateTo(
        -100,
        duration: const Duration(milliseconds: 150),
        curve: Curves.fastOutSlowIn,
      );
    } else if (position.extentBefore != 0) {
      animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
