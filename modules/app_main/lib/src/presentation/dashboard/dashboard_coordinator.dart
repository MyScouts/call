import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/system_setting.dart';
import 'package:flutter/material.dart';

import 'dashboard/widget/dashboard_option_sheet.dart';
import 'dashboard/widget/remove_confirm_dialog.dart';
import '../notification/notification_screen.dart';

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

  Future<T?> startSystemSetting<T>(int page) {
    return Navigator.of(this).pushNamed(
      SystemSetting.routerName,
      arguments: page,
    );
  }

  Future<T?> startNotification<T>() {
    return Navigator.of(this).pushNamed(NotificationScreen.routerName);
  }

  void removeConfirm({required Function() onRemoved}) {
    showDialog(
      context: this,
      builder: (_) {
        return RemoveConfirmDialog(onRemoved: onRemoved);
      },
    );
  }

  Future<T?> handleStartAppWidget<T>({required String id, String? path}) async {
    switch (id) {
      default:
        if (path != null) {
          Navigator.of(this).pushNamed(path);
        } else {
          showToastMessage(
            'Tính năng đang được phát triển',
            ToastMessageType.warning,
          );
        }
        break;
    }
    return null;
  }
}
