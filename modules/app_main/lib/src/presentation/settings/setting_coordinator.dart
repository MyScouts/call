import 'package:app_main/src/presentation/settings/setting_screen.dart';
import 'package:flutter/material.dart';

extension SettingCoordinator on BuildContext {
  Future<T?> startSetting<T>() {
    return Navigator.of(this).pushNamed(SettingScreen.routeName);
  }
}
