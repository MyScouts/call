import 'package:app_main/src/presentation/call/call_1v1/call_1v1_page.dart';
import 'package:flutter/material.dart';

extension PhoneBookDetailCoordinator on BuildContext {
  Future<T?> startCall<T>(
      {Key? key,
      required String? fromUserId,
      required String? toUserId,
      required bool isVideo,
      bool? incomingUI,
      bool? useCall2}) {
    return Navigator.of(this).pushNamed(Call1V1Page.routeName, arguments: {
      'key': key,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'isVideo': isVideo,
      'useCall2': useCall2,
      'incomingUI': incomingUI,
    });
  }
}
