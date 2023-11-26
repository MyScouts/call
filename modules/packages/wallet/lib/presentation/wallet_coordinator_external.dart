import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

extension WalletCoordinatorExternalExt on BuildContext {
  AppCoordinatorShared get shared => injector.get();

  Future<T?> startChat<T>(int userId) => shared.startChat(userId);

  // Future<T?>? startUpgradeJA<T>() => shared.startUpgradeJA();
}
