import 'package:app_main/src/presentation/pdone/profile/profile_screen.dart';
import 'package:flutter/material.dart';

extension AuthenticationCoordinator on BuildContext {
  Future<T?> startProfile<T>({
    String? userId,
  }) {
    return Navigator.of(this).pushNamed(
      ProfileScreen.routeName,
      arguments: {
        "userId": userId,
      },
    );
  }
}
