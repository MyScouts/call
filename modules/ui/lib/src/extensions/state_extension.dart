import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../toast_message/toast_message.dart';

extension CopyTextExt on State<StatefulWidget> {
  void copyText(String? text, {String? message}) {
    Clipboard.setData(ClipboardData(text: text ?? '')).then((value) {
      showToastText(message ?? 'Đã sao chép');
    });
  }
}
