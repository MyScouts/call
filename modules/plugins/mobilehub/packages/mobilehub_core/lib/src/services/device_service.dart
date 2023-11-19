import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:easy_file/easy_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@injectable
class DeviceService {
  static Future<PackageInfo> getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  Future<void> copy(String text) => FlutterClipboard.copy(text);

  Future<void> setStatusBar({Color? color}) async {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    await FlutterStatusbarcolor.setStatusBarColor(color ?? Colors.transparent);
  }

  Future<void> statusbar(bool isDark) async {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(isDark);
  }

  Future<void> updateNavigationBarColors(bool isDark,
      [Color buttombarColor = const Color(0xFF232323)]) async {
    if (isDark) {
      await FlutterStatusbarcolor.setNavigationBarColor(buttombarColor);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    } else {
      await FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
      await FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
    }
  }

  dynamic readFile(String path) => getFile(path);
}
