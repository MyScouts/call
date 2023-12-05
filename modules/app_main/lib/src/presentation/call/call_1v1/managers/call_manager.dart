
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/socket/chat_socket.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/android_call_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import 'ios_call_manager.dart';

const String kFrom = 'from';
const String kTo = 'to';
const String kisVideoCall = 'isVideoCall';
const String kCustomData = 'customData';
const String kVideoQuality = 'videoQuality';

class CallManager {
  final AndroidCallManager? _androidCallManager = AndroidCallManager.shared;
  final IOSCallManager? _iOSCallManager = IOSCallManager.shared;
  final StringeeClient client = StringeeClient();
  final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();

  static CallManager? _instance;
  static CallManager get shared {
    _instance ??= CallManager._internal();
    return _instance!;
  }

  CallManager._internal();

  void initCallL(BuildContext context) {
    if (isAndroid) {
      _androidCallManager!.setContext(context);

      ///cấp quyền truy cập với android
      requestPermissions();
    } else {
      /// Cấu hình thư viện để nhận push notification và sử dụng Callkit để show giao diện call native của iOS
      _iOSCallManager!.configureCallKeep();
    }

    /// Lắng nghe sự kiện của StringeeClient(kết nối, cuộc gọi đến...)
    client.eventStreamController.stream.listen((event) {
      Map<dynamic, dynamic> map = event;
      switch (map['eventType']) {
        case StringeeClientEvents.didConnect:
          handleDidConnectEvent();
          break;
        case StringeeClientEvents.didDisconnect:
          handleDiddisconnectEvent();
          break;
        case StringeeClientEvents.didFailWithError:
          handleDidFailWithErrorEvent(map['body']['code'], map['body']['message']);
          break;
        case StringeeClientEvents.requestAccessToken:
          handleRequestAccessTokenEvent();
          break;
        case StringeeClientEvents.didReceiveCustomMessage:
          handleDidReceiveCustomMessageEvent(map['body']);
          break;
        case StringeeClientEvents.incomingCall:
          StringeeCall? call = map['body'];
          if (isAndroid) {
            _androidCallManager!.handleIncomingCallEvent(call!, context);
          } else {
            _iOSCallManager!.handleIncomingCallEvent(call!, context);
          }
          break;
        case StringeeClientEvents.incomingCall2:
          StringeeCall2? call = map['body'];
          if (isAndroid) {
            _androidCallManager!.handleIncomingCall2Event(call!, context);
          } else {
            _iOSCallManager!.handleIncomingCall2Event(call!, context);
          }
          break;
        default:
          break;
      }
    });
  }

  requestPermissions() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    List<Permission> permissions = [
      Permission.camera,
      Permission.microphone,
    ];
    if (androidInfo.version.sdkInt >= 31) {
      permissions.add(Permission.bluetoothConnect);
    }
    await permissions.request();
    if (androidInfo.version.sdkInt >= 33) {
      // Register permission for show notification in android 13
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    }
  }

  Future<void> registerPushWithStringeeServer() async {
    if (isAndroid) {
      Stream<String> tokenRefreshStream = FirebaseMessaging.instance.onTokenRefresh;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? registered = (prefs.getBool("register") == null) ? false : prefs.getBool("register");

      ///kiểm tra đã register push chưa
      if (registered != null && !registered) {
        FirebaseMessaging.instance.getToken().then((token) {
          client.registerPush(token!).then((value) {
            if (value['status']) {
              prefs.setBool("register", true);
              prefs.setString("token", token);
            }
          });
        });
      }

      ///Nhận token mới từ firebase
      tokenRefreshStream.listen((token) {
        ///Xóa token cũ
        client.unregisterPush(prefs.getString("token")!).then((value) {
          if (value['status']) {
            ///Register với token mới
            prefs.setBool("register", false);
            prefs.remove("token");
            client.registerPush(token).then((value) {
              if (value['status']) {
                prefs.setBool("register", true);
                prefs.setString("token", token);
              }
            });
          }
        });
      });
    } else {
      _iOSCallManager!.registerPushWithStringeeServer();
    }
  }

  /// StringeeClient Listeners
  ///
  void handleDidConnectEvent() {
    dlog("handleDidConnectEvent");
    if (!isAndroid) {
      _iOSCallManager!.startTimeoutForIncomingCall();
    }

    registerPushWithStringeeServer();
  }

  void handleDiddisconnectEvent() {
    dlog("handleDiddisconnectEvent");
    if (!isAndroid) {
      _iOSCallManager!.stopTimeoutForIncomingCall();
    }
  }

  void handleDidFailWithErrorEvent(int? code, String message) {
    dlog('code: $code, message: $message');
  }

  void handleRequestAccessTokenEvent() {
    dlog('Request new access token');
  }

  void handleDidReceiveCustomMessageEvent(Map<dynamic, dynamic> map) {
    dlog('${'from: ' + map['fromUserId']}\nmessage: ' + map['message']);
  }
}
