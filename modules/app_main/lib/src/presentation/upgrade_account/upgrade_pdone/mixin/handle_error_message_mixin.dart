import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:flutter/material.dart';

mixin HandleErrorMessageMixin<T extends StatefulWidget> on State<T> {
  bool showErrorMessage(dynamic e) {
    if (e is DioError) {
      if (e.error is SocketException) {
        showToastMessage(
          'Vui lòng kiểm tra kết nối mạng.',
          ToastMessageType.error,
        );
        return true;
      }

      final message = e.toMessage(context);

      showToastMessage(message, ToastMessageType.error);
      return true;
    } else {
      return false;
    }
  }
}
