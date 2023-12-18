import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecases/user_share_preferences_usecase.dart';
import 'push_notification_service.dart';

enum AppLifeNotification {
  init,
  authenticated,
  logouted,
}

@singleton
class NotificationService {
  final LoggerService _loggerService;

  NotificationService(this._loggerService);

  final _appLifeController = BehaviorSubject<AppLifeNotification>();

  Stream<AppLifeNotification> get onListenerAppLife async* {
    yield* _appLifeController.stream.asBroadcastStream();
  }

  void add(AppLifeNotification event) {
    _appLifeController.sink.add(event);
  }

  /// notification click
  final _openNotificationController = BehaviorSubject<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get onListenerOpenNotification async* {
    yield* _openNotificationController.stream.asBroadcastStream();
  }

  int index = 0;

  void openNotification(Map<String, dynamic> payload) {
    _openNotificationController.sink.add(payload);
  }

  /// notification click end
  void dispose() {
    _appLifeController.close();
    _openNotificationController.close();
  }

  Future<String?> getFCMToken() async {
    if (!isMobile) {
      return 'token';
    }

    final fcmToken = await FirebaseMessaging.instance.getToken();
    _loggerService.d('[FCM]: ${fcmToken ?? ''}');
    debugPrint("fcmToken: $fcmToken");
    return fcmToken;
  }

  Future<void> onListenerNotification(BuildContext context) async {
    debugPrint("onListenerNotification");

    if (!isMobile) {
      return;
    }

    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _loggerService
          .d('[fcm] User granted permission: ${settings.authorizationStatus}');
      final userSharePreferencesUsecase =
          injector.get<UserSharePreferencesUsecase>();
      if (userSharePreferencesUsecase.getSubTopicFCM == false) {
        await messaging.subscribeToTopic('vdone');
        await messaging.subscribeToTopic('public');
        await messaging.subscribeToTopic(isIOS ? 'ios' : 'android');
        await userSharePreferencesUsecase.saveSubTopicFCM();
      }
    }

    unawaited(FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message == null) {
        return;
      }
      _loggerService.d('[fcm] getInitialMessage ${message.toMap()}');
      if (message.data.isNotEmpty) {
        injector.get<NotificationService>().openNotification(message.toMap());
      }
      updateCount(message.data);
    }));

    FirebaseMessaging.onMessage.listen((data) {
      _loggerService.d("onMessage: ${data.toMap()}");
      showFlutterNotification(data);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      openNotification(message.toMap());
    });
  }

  Future unsubscribeNotification() async {
    final messaging = FirebaseMessaging.instance;
    await messaging.unsubscribeFromTopic('vdone');
    await messaging.unsubscribeFromTopic('public');
    await messaging.unsubscribeFromTopic(isIOS ? 'ios' : 'android');
    final userSharePreferencesUsecase =
        injector.get<UserSharePreferencesUsecase>();
    User? user = userSharePreferencesUsecase.getUserInfo();
    if (user != null && user.id != null) {
      final topic = 'user_${user.id}';
      await messaging.unsubscribeFromTopic(topic);
    }
    await messaging.deleteToken();
  }
}
