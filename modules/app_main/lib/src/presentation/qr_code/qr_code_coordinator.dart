import 'dart:async';

import 'package:app_main/src/presentation/qr_code/qr_code_screen.dart';
import 'package:flutter/material.dart';

extension DeeplinkCoordinator on BuildContext {
  Future<T?> startScanQrCode<T>() {
    return Navigator.of(this).pushNamed(QrCodeScanScreen.routeName);
  }
}
