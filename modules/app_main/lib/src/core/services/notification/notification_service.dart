import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

enum ApplifeNotification {
  init,
  authenticated,
  logouted,
}

@singleton
class NotificationService {
  // final LoggerService _loggerService;

  // NotificationService(this._loggerService);

  final _applifeController = BehaviorSubject<ApplifeNotification>();

  Stream<ApplifeNotification> get onListenerAppLife async* {
    yield* _applifeController.stream.asBroadcastStream();
  }

  void add(ApplifeNotification event) {
    _applifeController.sink.add(event);
  }

  /// notification click
  final _openNotificationController = BehaviorSubject<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get onListenerOpenNotification async* {
    yield* _openNotificationController.stream.asBroadcastStream();
  }

  void openNotificaiton(Map<String, dynamic> payload) {
    _openNotificationController.sink.add(payload);
  }

  /// notification click end
  void dispose() {
    _applifeController.close();
    _openNotificationController.close();
  }

  // Future<String?> getFCMToken() async {
  //   if (!isMobile) {
  //     return 'token';
  //   }

  //   final fcmToken = await FirebaseMessaging.instance.getToken();
  //   _loggerService.d('[FCM]: ${fcmToken ?? ''}');
  //   return fcmToken;
  // }

  // Future<void> onListenerNotification(BuildContext context) async {
  //   if (!isMobile) {
  //     return;
  //   }

  //   final messaging = FirebaseMessaging.instance;

  //   final settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );

  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     _loggerService
  //         .d('[fcm] User granted permission: ${settings.authorizationStatus}');
  //     final userSharePreferencesUsecase =
  //         injector.get<UserSharePreferencesUsecase>();
  //     if (userSharePreferencesUsecase.getSubTopicFCM == false) {
  //       await messaging.subscribeToTopic('public');
  //       await messaging.subscribeToTopic(isIOS ? 'ios' : 'android');
  //       await userSharePreferencesUsecase.saveSubTopicFCM();
  //     }
  //   }

  //   unawaited(FirebaseMessaging.instance
  //       .getInitialMessage()
  //       .then((RemoteMessage? message) {
  //     if (message == null) {
  //       return;
  //     }

  //     if (message.data.isNotEmpty) {
  //       injector.get<NotificationService>().openNotificaiton(message.data);
  //     }

  //     updateCount(message.data);
  //   }));

  //   FirebaseMessaging.onMessage.listen((data) {
  //     if (MyNavigatorObserver.listRoute
  //             .contains(WatchLiveStreamScreen.routeName) ||
  //         MyNavigatorObserver.listRoute
  //             .contains(CreateLiveStreamScreen.routeName)) {
  //       return;
  //     }
  //     final jsonData = jsonDecode(data.data['data']);
  //     if (jsonData.containsKey('liveId') &&
  //         !jsonData.containsKey('isFollowing')) {
  //       showDialogApplication(
  //         context,
  //         title: 'Bạn được mời vào livestream',
  //         content: 'Đồng ý để vào phòng live',
  //         actions: [
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: SizedBox(
  //                   height: 44,
  //                   child: OutlinedButton(
  //                     style: OutlinedButton.styleFrom(
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(10)),
  //                     ),
  //                     onPressed: () {
  //                       Navigator.of(context).pop(false);
  //                     },
  //                     child: const Text(
  //                       'HỦY BỎ',
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(width: 16),
  //               Expanded(
  //                 child: GradiantButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop(true);
  //                   },
  //                   child: const Text(
  //                     'ĐỒNG Ý',
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           )
  //         ],
  //       ).then((agree) {
  //         if (agree == true) {
  //           if (jsonData['liveType'] == 'password_locked') {
  //             context
  //                 .buildInputPassDialog(context, int.parse(jsonData['liveId']))
  //                 .then((liveDetail) {
  //               if (liveDetail != null) {
  //                 context.watchLiveStreamScreen(liveDetail: liveDetail.live);
  //               }
  //             });
  //           } else {
  //             injector
  //                 .get<LiveStreamUsecase>()
  //                 .joinLive(int.parse(jsonData['liveId']), '', true)
  //                 .then((liveDetail) {
  //               context.watchLiveStreamScreen(liveDetail: liveDetail.live);
  //             });
  //           }
  //         }
  //       });
  //     } else {
  //       showFlutterNotification(data);
  //     }
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     if (MyNavigatorObserver.listRoute
  //             .contains(WatchLiveStreamScreen.routeName) ||
  //         MyNavigatorObserver.listRoute
  //             .contains(CreateLiveStreamScreen.routeName)) {
  //       return;
  //     }
  //     updateCount(message.data);
  //     final jsonData = jsonDecode(message.data['data']);
  //     _loggerService
  //         .d('[fcm] onMessageOpenedApp event was published!: ${message.data}');
  //     if (message.data.isNotEmpty) {
  //       if (jsonData.containsKey('liveId')) {
  //         if (jsonData['liveType'] == 'password_locked') {
  //           context
  //               .buildInputPassDialog(context, int.parse(jsonData['liveId']))
  //               .then((liveDetail) {
  //             if (liveDetail != null) {
  //               context.watchLiveStreamScreen(liveDetail: liveDetail.live);
  //             }
  //           });
  //         } else {
  //           injector
  //               .get<LiveStreamUsecase>()
  //               .joinLive(int.parse(jsonData['liveId']), '', true)
  //               .then((liveDetail) {
  //             context.watchLiveStreamScreen(liveDetail: liveDetail.live);
  //           });
  //         }
  //       } else {
  //         openNotificaiton(message.data);
  //       }
  //     }
  //   });
  // }
}
