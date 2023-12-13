import 'dart:async';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/permission_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../call/1vs1/bloc/call_1vs1_bloc.dart';
import '../call/1vs1/views/call_1vs1_screen.dart';
import '../call/models/call_1vs1_state_data.dart';

extension CallCoordinator on BuildContext {
  Future<T?> showIncomingCall<T>({
    required Call1vs1Bloc bloc,
  }) async {
    if (!(await requestCallPermissions())) {
      return null;
    }

    return Navigator.of(this).pushNamed(
      Call1vs1Screen.routeName,
      arguments: {
        'bloc': bloc,
        'callType': bloc.state.callType,
      },
    );
  }

  Future<T?> startCallById<T>({
    required int participantID,
    CallType callType = CallType.audio,
  }) async {
    if (!(await requestCallPermissions())) {
      return null;
    }
    return Navigator.of(this).pushNamed(
      Call1vs1Screen.routeName,
      arguments: {
        'callType': callType,
        'userCall2': true,
        'participant': User(id: participantID),
      },
    );
  }

  Future<bool> requestCallPermissions() async {
    if (isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      final granted = await PermissionService.requestPermissions([
        Permission.camera,
        Permission.microphone,
        if (Platform.isAndroid && androidInfo.version.sdkInt >= 31) Permission.bluetoothConnect,
      ]);
      if (androidInfo.version.sdkInt >= 33) {
        // Register permission for show notification in android 13
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
            .requestNotificationsPermission();
      }
      LoggerService.print('[requestCallPermissions] $granted');
      return granted.every((e) => e);
    }
    return true;
  }
}
