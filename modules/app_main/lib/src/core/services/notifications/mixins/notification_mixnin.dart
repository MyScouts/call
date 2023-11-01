import 'package:flutter/material.dart';

import '../notification_service.dart';

mixin NotificationMixin<T extends StatefulWidget> on State<T> {
  NotificationService get notificationService;
  GlobalKey<NavigatorState> get rootKey;
  bool get isProduction;

  void onListenerOpenNotification(Map<String, dynamic> notification);

  @override
  void initState() {
    super.initState();
    notificationService.onListenerAppLife.listen((appState) {
      switch (appState) {
        case AppLifeNotification.init:
          if (isProduction) {
            notificationService.onListenerNotification(rootKey.currentContext!);
          }
          break;
        case AppLifeNotification.authenticated:
          break;
        case AppLifeNotification.logouted:
          break;
      }
    });

    notificationService.onListenerOpenNotification
        .listen(onListenerOpenNotification);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        notificationService.add(AppLifeNotification.init);
      });
    });
  }
}
