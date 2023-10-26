import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

extension AuthenticationCoordinator on BuildContext {
  Future<T?> startDashboardUtil<T>() {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      DashboardScreen.routeName,
      (route) => false,
    );
  }
}
