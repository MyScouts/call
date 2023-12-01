import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/chat/message_dto.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_cubit.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io_client;

import 'package:flutter/foundation.dart';

void dlog(var value) {
  if (kDebugMode) {
    print('DevLog: ${value.toString()}');
  }
}

@Injectable()
class ChatSocket {
  io_client.Socket? _socket;

  bool _forceDisconnect = false;

  void connect() async {
    _forceDisconnect = false;
    await _initSocket();
    _connect();
  }

  /// still keep old listener when disconnect socket
  void disconnect() {
    _forceDisconnect = true;

    if (_socket != null) {
      _socket?.dispose();
      _socket = null;
    }
  }

  /// only call this method when logout
  /// remove all listener and disconnect
  void destroy() {
    disconnect();
  }

  Future<void> _initSocket() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
    }

    _socket = io_client.io(
      '${Configurations.baseUrl}user?deviceId=$deviceId',
      io_client.OptionBuilder()
          .setTransports(["websocket"])
          .setPath('/api/socket.io')
          .disableAutoConnect()
          .enableForceNewConnection()
          .enableReconnection()
          .setReconnectionAttempts(3)
          .setTimeout(2000)
          .setAuth({
            'token': getIt.get<UserSharePreferencesUsecase>().getToken() ?? '',
          })
          .build(),
    );
  }

  void _connect() {
    _socket?.connect();
    _socket?.on('connect', (_) {
      dlog('❤️❤️❤️❤️❤️ SOCKET CONNECTED');
    });

    _socket?.onReconnect((data) {
      dlog('❤️❤️❤️❤️❤️ SOCKET RECONNECT');
    });

    _socket?.on('connect_timeout', (_) {
      dlog('❤️❤️❤️❤️❤️ SOCKET CONNECT TIMEOUT');
      reconnect();
    });

    _socket?.on('error', (_) {
      dlog('❤️❤️❤️❤️❤️ SOCKET ERROR');
    });

    _socket?.on('reconnecting', (_) {
      dlog('❤️❤️❤️❤️❤️ SOCKET RECONNECTING');
    });

    _socket?.on('disconnect', (_) {
      dlog('⚠️⚠️⚠️⚠️⚠️ SOCKET DISCONNECT');
      reconnect();
    });

    _socket?.on('reconnect_failed', (_) {
      dlog('⚠️⚠️⚠️⚠️⚠️ SOCKET RECONNECT FAILED');
    });

    _socket?.on('reconnect_error', (_) {
      dlog('⚠️⚠️⚠️⚠️⚠️ SOCKET RECONNECT ERROR');
    });

    _socket?.on('reconnect_attempt', (_) {
      dlog('✨✨✨✨✨️ SOCKET RECONNECT ATTEMPT');
    });
    _socket?.on('onNewMessage', (data) {
      _transformMessageData(data);
      getIt.get<ConversationCubit>().init();
    });
  }

  void reconnect() {
    if (!_forceDisconnect) connect();
  }

  void _transformMessageData(dynamic data) {
    if (data != null) {
      final messageData = MessageDto.fromJson(data);
      getIt.get<ChatRoomCubit>().updateMessage(messageData);
    }
  }
}
