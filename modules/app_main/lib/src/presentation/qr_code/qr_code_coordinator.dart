import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_screen.dart';
import 'package:app_main/src/presentation/qr_code/scan_qr_code_screen.dart';
import 'package:flutter/material.dart';

extension DeeplinkCoordinator on BuildContext {
  Future<T?> startScanQrCode<T>() {
    return Navigator.of(this).pushNamed(ScanQrCodeScanScreen.routeName);
  }

  Future<T?> startQrCode<T>({required User userInfo}) {
    return Navigator.of(this).pushNamed(QrCodeScreen.routeName, arguments: {
      'userInfo': userInfo,
    });
  }
}
