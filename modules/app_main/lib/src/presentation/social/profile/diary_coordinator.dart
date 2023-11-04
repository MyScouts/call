import 'package:app_main/src/presentation/social/profile/diary_screen.dart';
import 'package:flutter/material.dart';

extension AuthenticationCoordinator on BuildContext {
  Future<T?> startDiary<T>({
    String? userId,
  }) {
    return Navigator.of(this).pushNamed(
      DiaryScreen.routeName,
      arguments: {
        "userId": userId,
      },
    );
  }
}
