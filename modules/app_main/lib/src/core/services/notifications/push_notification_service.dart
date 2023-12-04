import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:app_core/app_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../domain/entities/notification/notification_type.dart';
import 'notification_service.dart';

class PushNotificationService {}

void updateCount(Map<String, dynamic> data) {
  final countUnread = data['countUnread'];
  log('[Push] [#countUnread] $countUnread');

  if (countUnread != null) {
    unawaited(updateBadgeCount(int.parse('$countUnread')));
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await setupFlutterNotifications();
  final type = message.data['type'];
  if (type == 'CHAT_EVENT') {
    showFlutterNotification(message); // Remove for Test duplicate noti
  }
  // If you're going to use other Firebase services in the background,
  // such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  debugPrint('[Push] Handling a background message ${message.messageId}');
  debugPrint('[Push] Background message ${message.data}');

  final pnType = message.data['type'];
  if (pnType is String && pnType == 'CALL_EVENT') {}
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  debugPrint("setupFlutterNotifications");
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    enableLights: true,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@drawable/icon_notify'),
      iOS: DarwinInitializationSettings(
          onDidReceiveLocalNotification: _onDidReceiveLocalNotification),
    ),
    onDidReceiveNotificationResponse:
        _onDidReceiveBackgroundNotificationResponse,
    onDidReceiveBackgroundNotificationResponse:
        onDidReceiveBackgroundNotificationResponse,
  );

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

@pragma('vm:entry-point')
void _onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse) {
  debugPrint('[_onDidReceiveBackgroundNotificationResponse]: '
      '${notificationResponse.payload}');

  if (notificationResponse.payload?.isNotEmpty ?? false) {
    final remoteNoti = jsonDecode(notificationResponse.payload!);
    injector.get<NotificationService>().openNotification(remoteNoti);
    updateCount(remoteNoti);
  }
}

@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse) {
  debugPrint('[onDidReceiveBackgroundNotificationResponse]: '
      '${notificationResponse.payload}');
}

@pragma('vm:entry-point')
void _onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {}

void showFlutterNotification(RemoteMessage message) {
  if (isIOS) {
    return;
  }

  final RemoteNotification? notification = message.notification;
  var payload = message.data;
  final type = intPareSafe(payload['type']);
  debugPrint('[FCM]: forground $type');

  if (type != null) {
    final typeNotification = convertToNotificationType(type);
    if (typeNotification != null) {
      final id = payload['id'];
      payload = {
        'data': {
          'type': '$type',
          'id': '$id',
        }
      };
      flutterLocalNotificationsPlugin.show(
        notification?.hashCode ?? 0,
        'Thông báo mới',
        '',
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@drawable/icon_notify',
            priority: Priority.high,
            fullScreenIntent: true
          ),
        ),
        payload: jsonEncode(payload),
      );
      return;
    }
  } else {
    final notiData = payload['data'];
    LoggerService.print("notiData: $notiData");
    if (payload.isNotEmpty) {
      String? title;
      String? body;
      if (notiData != null) {
        if (payload.isNotEmpty) {
          final content = jsonDecode(payload['data']);
          title = 'Tin nhắn mới';
          body = content?['message']?['content'];
        } else {
          title = notification?.title;
          body = notification?.body;
        }

        flutterLocalNotificationsPlugin.show(
          notification?.hashCode ?? 0,
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@drawable/icon_notify',
              priority: Priority.high,
            ),
          ),
          payload: jsonEncode(payload),
        );
      }
    } else {
      flutterLocalNotificationsPlugin.show(
        notification?.hashCode ?? 0,
        notification!.title ?? "",
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@drawable/icon_notify',
            priority: Priority.high,
            fullScreenIntent: true
          ),
        ),
        payload: jsonEncode(payload),
      );
    }
  }
}

void showNotificationLocal({required Map<String, dynamic> payload}) {
  showFlutterNotification(RemoteMessage.fromMap(payload));
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> updateBadgeCount(int count) async {
  if (await FlutterAppBadger.isAppBadgeSupported()) {
    await FlutterAppBadger.updateBadgeCount(count);
  }
}
