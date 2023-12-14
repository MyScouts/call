import 'dart:async';
import 'dart:convert';

import 'package:app_core/app_core.dart';
import 'package:app_main/app_main.dart';
import 'package:app_main/src/core/networking/networking_factory.dart';
import 'package:app_main/src/data/data_sources/remote/user_api.dart';
import 'package:app_main/src/data/models/responses/push_call_message_info.dart';
import 'package:app_main/src/data/repositories/impl/user_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';


const keyEndpoint = '_key_ApiEndpointKey';

Future<dynamic> handleCallPN(
  PushCallMessageInfo message,
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
) async {
  debugPrint('handleCallPN: ${message.toJson()}');
  final callProjectId = message.projectId ?? 0;

  if (message.isEnded) {
    return flutterLocalNotificationsPlugin.cancel(callProjectId);
  }

  final callerId = int.tryParse(message.from?.number ?? '');
  if (callerId == null) {
    return;
  }

  final sharedPreferences = await SharedPreferences.getInstance();
  // Must be create usecase manually because of this method will be called in
  // `vm:entry-point`
  final userRepository = AuthRepositoryImpl(
    UserApi(
      NetworkingFactory.createDio(
        sharedPreferences.getString(keyEndpoint) ??
            'https://dev.vdone.info/',
        sharedPreferences,
        onLogout,
        false,
      ),
    ),
  );
  final caller = await userRepository.getUserById(id: callerId).catchError(
        (_,s) {
          print(_);
          print(s);
        },
      );

  const androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'vdone_call_push_channel',
    'Cuộc gọi tới',
    channelDescription: 'Incoming Call Notification',
    importance: Importance.max,
    priority: Priority.max,
    ticker: 'incoming_call',
    playSound: true,
    fullScreenIntent: true,
    sound: RawResourceAndroidNotificationSound('incoming_call_ringtone'),
  );

  const darwinPlatformChannelSpecifics = DarwinNotificationDetails(
    presentSound: true,
    presentBadge: false,
    presentAlert: false,
  );

  return flutterLocalNotificationsPlugin.show(
    callProjectId,
    'Cuộc gọi đến',
    caller?.displayName ?? callerId.toString(),
    const NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: darwinPlatformChannelSpecifics,
    ),
    payload: jsonEncode(message.toJson()),
  );
}
