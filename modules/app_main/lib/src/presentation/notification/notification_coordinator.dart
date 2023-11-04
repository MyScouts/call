import 'dart:convert';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:flutter/material.dart';

extension NotificationCoordinator on BuildContext {
  Future<T?> startOpenNotification<T>(Map<String, dynamic> notification) async {
    LoggerService.print('[fcm] startOpenNotification: '
        '${notification.toString()}');

    final dataModelDetail = notification['data'];

    if (notification['type'] == 'CHAT_EVENT' && dataModelDetail is String) {
      LoggerService.print('[startOpenNotification] $json');
    } else {}

    return startDialogConfirmRegisterJA();
  }
}
