import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:app_main/src/presentation/chat/chat_room/chat_room_page.dart';

extension WalletCoordinatorExternalExt on BuildContext {
  AppCoordinatorShared get shared => injector.get();

  Future<T?> startChat<T>(int userId) async {
    return Navigator.of(this).pushNamed(ChatRoomPage.routeName, arguments: {
      'memberId': userId,
    });
  }

// Future<T?>? startUpgradeJA<T>() => shared.startUpgradeJA();
}
