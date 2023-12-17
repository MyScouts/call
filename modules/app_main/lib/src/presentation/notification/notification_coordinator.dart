import 'dart:convert';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/chat/chat_room/chat_room_page.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:flutter/material.dart';

import '../../application.dart';
import '../../core/coordinator/app_coordinator.dart';
import '../../core/services/notifications/push_notification_service.dart';

extension NotificationCoordinator on BuildContext {
  Future<T?> startOpenNotification<T>(Map<String, dynamic> notification) async {
    LoggerService.print('[fcm] startOpenNotification: '
        '${notification.toString()}');

    final payload = notification['data'];
    final type = MessageTypeFB.values.firstWhereOrNull((element) => element.type == payload['type']);
    if (type == MessageTypeFB.inviteToLive || type == MessageTypeFB.liveCreated) {
      //join_live
      // nếu đang trong phòng live thì k hiện thông báo nữa
      if (MyNavigatorObserver.listRoute.contains('/join_live')) {
        return null;
      }
      final liveData = jsonDecode(payload['data']);

      if (liveData['liveType'] == 'password_locked') {
        return AppCoordinator.rootNavigator.currentContext!.checkPassword((pass) {
          AppCoordinator.rootNavigator.currentContext!.joinLiveWithPass(liveData['liveId'], pass);
        }, liveData['liveId']);
      }
      return AppCoordinator.rootNavigator.currentContext!.joinLive(liveData['liveId']);
    }
    if (MyNavigatorObserver.listRoute.contains(ChatRoomPage.routeName)) {
      return null;
    }
    // final dataModelDetail = notification['data'];
    //
    // print(dataModelDetail);
    //
    // if (notification['type'] == 'CHAT_EVENT' && dataModelDetail is String) {
    //   LoggerService.print('[startOpenNotification] $json');
    // } else {}

    return startDialogConfirmRegisterJA();
  }
}
