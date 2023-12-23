import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

@singleton
class StringeeService {
  StringeeService() {
    _client = StringeeClient();
    stringeeChat = StringeeChat(_client);
  }

  late StringeeChat stringeeChat;
  late StringeeClient _client;

  String? _clientId;
  String? get clientId => _clientId;
  StringeeClient get client => _client;

  String? _name;
  String? _avatar;
  String? _tokenFCM;

  void _onStringeeClientListener(event) {
    final Map<dynamic, dynamic> map = event;
    stringeeLog(
      'StringeeService eventType: ${map['eventType']} - event: $event',
    );

    switch (map['eventType']) {
      case StringeeClientEvents.didConnect:
        handleDidConnectEvent();
        break;
      case StringeeClientEvents.didDisconnect:
        handleDiddisconnectEvent();
        break;
      case StringeeClientEvents.didFailWithError:
        final int code = map['body']['code'];
        final String msg = map['body']['message'];
        handleDidFailWithErrorEvent(code, msg);
        break;
      case StringeeClientEvents.requestAccessToken:
        handleRequestAccessTokenEvent();
        break;
      case StringeeClientEvents.didReceiveCustomMessage:
        handleDidReceiveCustomMessageEvent(map['body']);
        break;
      case StringeeClientEvents.userBeginTyping:
        handleUserBeginTypingEvent(map['body']);
        break;
      case StringeeClientEvents.userEndTyping:
        handleUserEndTypingEvent(map['body']);
        break;
      default:
        break;
    }
  }

  void connect(String token, String? name, String? avatar) {
    _client.eventStreamController.stream.listen(_onStringeeClientListener);

    stringeeLog('StringeeService token(isProd: $connect): $token');

    _client.connect(token).then((value) async {
      _name = name;
      _avatar = avatar;

      if (isIOS) {
        _tokenFCM = await FirebaseMessaging.instance.getAPNSToken();
      } else if (token.isNotEmpty) {
        _tokenFCM = token;
      }
    });
  }

  Future<bool?> disconnect() async {
    return true;
    // try {
    //   if (_tokenFCM?.isNotEmpty ?? false) {
    //     await _client.unregisterPush(_tokenFCM!);
    //   }
    //
    //   stringeeLog(
    //       'stringee disconnect (hasConnected: ${_client.hasConnected})');
    //   if (_client.hasConnected) {
    //     await _client.disconnect();
    //   }
    //   return true;
    // } catch (_) {}
    // return false;
  }

  /// Invoked when the StringeeClient is connected
  void handleDidConnectEvent() {
    _clientId = _client.userId;
    _updateInformationClient();
    registerPushNotify();
  }

  Future<void> registerPushNotify() async {
    if (_tokenFCM?.isNotEmpty ?? false) {
      await _client
          .registerPush(_tokenFCM!, isProduction: true, isVoip: false)
          .then((result) async {
        final status = result['status'];
        final message = result['message'];
        stringeeLog(' StringeeService registerPushNotify: '
            'status: $status] $message');
      });
    }
  }

  Future<void> _updateInformationClient() async {
    await updateName(_name);
    await updateAvatar(_avatar);
  }

  Future<void> updateName(String? name) async {
    if (name?.isNotEmpty ?? false) {
      _name = name;
      await stringeeChat.updateUserInfo(name: name);
    }
  }

  Future<void> updateAvatar(String? avatar) async {
    if (avatar?.isNotEmpty ?? false) {
      _avatar = avatar;
      await stringeeChat.updateUserInfo(avatar: avatar);
    }
  }

  Future<void> updateInfo(String? avatar, String? name) async {
    if ((avatar?.isNotEmpty ?? false) && (name?.isNotEmpty ?? false)) {
      _avatar = avatar;
      _name = name;
      stringeeLog('updateInfo: avatar: $avatar name: $name');
      await stringeeChat.updateUserInfo(
        avatar: avatar,
        name: name,
      );
    } else {
      await updateName(name);
      await updateAvatar(avatar);
    }
  }

  /// Invoked when the StringeeClient is disconnected
  void handleDiddisconnectEvent() {}

  /// Invoked when StringeeClient connect false
  void handleDidFailWithErrorEvent(int code, String message) {}

  /// Invoked when your token is expired
  void handleRequestAccessTokenEvent() {}

  /// Invoked when get Custom message
  void handleDidReceiveCustomMessageEvent(Map<dynamic, dynamic> map) {}

  /// Invoked when user send begin typing event
  void handleUserBeginTypingEvent(Map<dynamic, dynamic> map) {}

  /// Invoked when user send end typing event
  void handleUserEndTypingEvent(Map<dynamic, dynamic> map) {}
}

Null Function(String msg) stringeeLog = (String msg) {
  if (enableLogStringee) {
    log('[StringeeSDK] $msg');
  }
};

const enableLogStringee = true;
