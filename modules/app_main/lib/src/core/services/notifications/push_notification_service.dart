import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../application.dart';
import '../../coordinator/app_coordinator.dart';
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
  debugPrint('[Push] Background message $message');

  final pnType = message.data['type'];
  if (pnType is String && pnType == 'CALL_EVENT') {
    Map<dynamic, dynamic> _notiData = message.data;
    Map<dynamic, dynamic> _data = json.decode(_notiData['data']);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    if (_data['callStatus'] == 'started') {
      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@drawable/icon_notify');
      const InitializationSettings initializationSettings =
          InitializationSettings(android: androidSettings);
      flutterLocalNotificationsPlugin.initialize(initializationSettings).then((value) async {
        if (value!) {
          /// Create channel for notification
          const AndroidNotificationDetails androidPlatformChannelSpecifics =
              AndroidNotificationDetails(
           'channelId', 'channelName',
            channelDescription: 'channelDescription',
            importance: Importance.high,
            priority: Priority.high,
            category: AndroidNotificationCategory.call,
            /// Set true for show App in lockScreen
            fullScreenIntent: true,
          );
          const NotificationDetails platformChannelSpecifics =
              NotificationDetails(android: androidPlatformChannelSpecifics);

          /// Show notification
          await flutterLocalNotificationsPlugin.show(
            1234,
            'Cuộc gọi đến',
            '',
            platformChannelSpecifics,
          );
        }
      });
    } else if (_data['callStatus'] == 'ended') {
      flutterLocalNotificationsPlugin.cancel(1234);
    }
  }
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
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
    enableLights: true,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@drawable/icon_notify'),
      iOS: DarwinInitializationSettings(onDidReceiveLocalNotification: _onDidReceiveLocalNotification),
    ),
    onDidReceiveNotificationResponse: _onDidReceiveBackgroundNotificationResponse,
    onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse,
  );

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
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
void _onDidReceiveBackgroundNotificationResponse(NotificationResponse notificationResponse) {
  debugPrint('[_onDidReceiveBackgroundNotificationResponse]: '
      '${notificationResponse.payload}');
  if (notificationResponse.payload?.isNotEmpty == true) {
    var remoteNoti = jsonDecode(notificationResponse.payload!);
    if (remoteNoti is String) {
      remoteNoti = jsonDecode(remoteNoti);
    }
    injector.get<NotificationService>().openNotification(remoteNoti);
    updateCount(remoteNoti);
  }
}

@pragma('vm:entry-point')
void onDidReceiveBackgroundNotificationResponse(NotificationResponse notificationResponse) {
  debugPrint('[onDidReceiveBackgroundNotificationResponse]: '
      '${notificationResponse.payload}');
}

enum MessageTypeFB {
  becomeFriend('BECOME_FRIEND'),
  newFollower('NEW_FOLLOWER'),
  followRequest('FOLLOW_REQUEST'),
  liveCreated('LIVE_CREATED'),
  inviteToLive('INVITE_TO_LIVE'),
  protectorRequestReply('PROTECTOR_REQUEST_REPLY');

  final String type;

  const MessageTypeFB(this.type);
}

@pragma('vm:entry-point')
void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {}

const AndroidNotificationDetails _androidNotificationDetails = AndroidNotificationDetails(
    'channelId', 'channelName',
    channelDescription: 'channelDescription',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
    fullScreenIntent: true);

void showFlutterNotification(RemoteMessage message) {
  // if (isIOS) {
  //   return;
  // }

  final RemoteNotification? notification = message.notification;
  final payload = message.data;
  final type = MessageTypeFB.values.firstWhereOrNull((element) => element.type == payload['type']);
  debugPrint('[FCM]: forground $type');

  final title = notification?.title ?? 'Tin nhắn mới';
  final body = notification?.body ?? '';
  if (type == MessageTypeFB.inviteToLive) {
    //join_live ['password_locked'] ['public']
    // nếu đang trong phòng live thì k hiện thông báo nữa
    if (MyNavigatorObserver.listRoute.contains('/join_live')) {
      return;
    }
    final liveData = jsonDecode(payload['data']);
    AppCoordinator.rootNavigator.currentContext!
        .showInviteDialog(title: body, liveId: liveData['liveId'], liveType: liveData['liveType']);
    return;
  }
  if (type == MessageTypeFB.liveCreated) {
    if (MyNavigatorObserver.listRoute.contains('/join_live')) {
      return;
    }
  }
  flutterLocalNotificationsPlugin.show(
    notification?.hashCode ?? 0,
    title,
    body,
    const NotificationDetails(
      android: _androidNotificationDetails,
    ),
    payload: jsonEncode(message.toMap()),
  );

  /// tôi comment lại đoạn cũ nhé
  // if (type != null) {
  //   final typeNotification = convertToNotificationType(type);
  //   if (typeNotification != null) {
  //     final id = payload['id'];
  //     payload = {
  //       'data': {
  //         'type': '$type',
  //         'id': '$id',
  //       }
  //     };
  //     flutterLocalNotificationsPlugin.show(
  //       notification?.hashCode ?? 0,
  //       'Thông báo mới',
  //       '',
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           channelDescription: channel.description,
  //           icon: '@drawable/icon_notify',
  //           priority: Priority.high,
  //         ),
  //       ),
  //       payload: jsonEncode(payload),
  //     );
  //     return;
  //   }
  // } else {
  //   final notiData = payload['data'];
  //   LoggerService.print("notiData: $notiData");
  //   if (payload.isNotEmpty) {
  //     String? title;
  //     String? body;
  //     if (notiData != null) {
  //       if (payload.isNotEmpty) {
  //         final content = jsonDecode(payload['data']);
  //         title = 'Tin nhắn mới';
  //         body = content?['message']?['content'];
  //       } else {
  //         title = notification?.title ?? 'Tin nhắn mới';
  //         body = notification?.body;
  //       }
  //
  //       flutterLocalNotificationsPlugin.show(
  //         notification?.hashCode ?? 0,
  //         title,
  //         body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             channelDescription: channel.description,
  //             icon: '@drawable/icon_notify',
  //             priority: Priority.high,
  //           ),
  //         ),
  //         payload: jsonEncode(payload),
  //       );
  //     }
  //   } else {
  //     flutterLocalNotificationsPlugin.show(
  //       notification?.hashCode ?? 0,
  //       notification!.title ?? "",
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel.id,
  //           channel.name,
  //           channelDescription: channel.description,
  //           icon: '@drawable/icon_notify',
  //           priority: Priority.high,
  //         ),
  //       ),
  //       payload: jsonEncode(payload),
  //     );
  //   }
  // }
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
