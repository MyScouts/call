import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_stores_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:flutter/material.dart';

extension AuthenticationCoordinator on BuildContext {
  Future<T?> startDashboardUtil<T>() {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      DashboardScreen.routeName,
      (route) => false,
    );
  }

  Future showAppStore({
    required List<AppItem> initApp,
    required Function(List<AppItem>) onCompleted,
  }) {
    return showModalBottomSheet(
      context: this,
      builder: (context) => AppStoreWidget(
        initApp: initApp,
        onCompleted: onCompleted,
      ),
    );
  }
}
