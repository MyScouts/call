import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:flutter/material.dart';

import 'dashboard/widget/dashboard_option_sheet.dart';

extension DashBoardCoordinator on BuildContext {
  Future<T?> startDashboardUtil<T>() {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      DashBoardScreen.routeName,
      (route) => false,
    );
  }

  Future showAppStore() {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      builder: (context) => const DashBoardOptionSheet(),
    );
  }
}
