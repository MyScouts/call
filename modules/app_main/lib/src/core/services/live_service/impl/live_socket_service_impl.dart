import 'package:app_main/src/core/services/live_service/live_socket_service.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

const socketConnectedEvent = 'connected';
const socketConnectionFailureEvent = 'connection failure';
const socketConnectionTimeOutEvent = 'connection timeout';
const socketReConnectEvent = 'reconnect';
const socketUserJoinEvent = 'userJoinLive';
const socketGiftGiven = 'giftGiven';
const socketGiftInfoUpdated = 'giftInfoUpdated';
const socketUserLeaveEvent = 'userLeaveLive';
const socketKickFromLiveEvent = 'userKickedFromLive';
const socketBannedEvent = 'userBannedFromReaction';
const socketMessageEvent = 'message';
const socketReactionEvent = 'reaction';
const socketPkStartEvent = 'pkStart';
const socketPkEndEvent = 'pkEnd';
const socketInvitePkEvent = 'invitePk';
const socketPkMessageEvent = 'pkMessage';
const socketReadyPkEvent = 'readyForPk';
const socketPkGiftUpdatedEvent = 'pkGiftUpdated';
const socketPkGameFinishEvent = 'pkgameFinished';

@Injectable(as: LiveSocketService)
class LiveSocketServiceImpl extends LiveSocketService {
  io.Socket? _socket;

  @override
  Future<void> connect(
    String url, {
    required String token,
    String? deviceId,
  }) async {
    if (_socket != null) disconnect();
    _socket = io.io(
      url,
      io.OptionBuilder()
          .setTransports(["websocket"])
          .setPath('/api/socket.io')
          .disableAutoConnect()
          .enableForceNewConnection()
          .enableReconnection()
          .setAuth({
            'token': token,
            'deviceId': deviceId,
          })
          .build(),
    );
    _socket!
      ..on(socketUserJoinEvent, (data) => emit(socketUserJoinEvent, data))
      ..on(socketGiftGiven, (data) => emit(socketGiftGiven, data))
      ..on(socketGiftInfoUpdated, (data) => emit(socketGiftInfoUpdated, data))
      ..on(socketUserLeaveEvent, (data) => emit(socketUserLeaveEvent, data))
      ..on(socketMessageEvent, (data) => emit(socketMessageEvent, data))
      ..on(socketKickFromLiveEvent,
          (data) => emit(socketKickFromLiveEvent, data))
      ..on(socketBannedEvent, (data) => emit(socketBannedEvent, data))
      ..on(socketReactionEvent, (data) => emit(socketReactionEvent, data))
      ..on(socketPkStartEvent, (data) => emit(socketPkStartEvent, data))
      ..on(socketPkEndEvent, (data) => emit(socketPkEndEvent, data))
      ..on(socketInvitePkEvent, (data) => emit(socketInvitePkEvent, data))
      ..on(socketPkMessageEvent, (data) => emit(socketPkMessageEvent, data))
      ..on(socketReadyPkEvent, (data) => emit(socketReadyPkEvent, data))
      ..on(socketPkGiftUpdatedEvent,
          (data) => emit(socketPkGiftUpdatedEvent, data))
      ..on(socketPkGameFinishEvent,
              (data) => emit(socketPkGameFinishEvent, data))
      ..onConnect(_handleConnect)
      ..onConnectError(_handleConnectionFailure)
      ..onConnectTimeout(_handleConnectionTimeout)
      ..onReconnect((_) => emit(socketReConnectEvent))
      ..connect();
  }

  void _handleConnect(_) {
    if (_socket == null) return;
    emit(socketConnectedEvent);
  }

  void _handleConnectionFailure(_) {
    if (_socket == null) return;
    emit(socketConnectionFailureEvent);
  }

  void _handleConnectionTimeout(_) {
    emit(socketConnectionTimeOutEvent);
  }

  @override
  void sendMessage(data) {
    if (_socket == null) return;
    _socket?.emit(socketMessageEvent, data);
  }

  @override
  Future<void> disconnect() async {
    _socket?.dispose();
    _socket = null;
  }

  @override
  io.Socket get socket => _socket!;
}
