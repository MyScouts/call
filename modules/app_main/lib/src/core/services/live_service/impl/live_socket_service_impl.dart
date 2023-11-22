import 'package:app_main/src/core/services/live_service/live_socket_service.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

const socketConnectedEvent = 'connected';
const socketMessageEvent = 'message';
const socketConnectionFailureEvent = 'connection failure';
const socketConnectionTimeOutEvent = 'connection timeout';
const socketReConnectEvent = 'reconnect';

@Injectable(as: LiveSocketService)
class LiveSocketServiceImpl extends LiveSocketService {
  io.Socket? _socket;

  @override
  Future<void> connect(String url) async {
    _socket = io.io(
      url,
      io.OptionBuilder()
          .setTransports(["websocket"])
          .disableAutoConnect()
          .enableForceNewConnection()
          .enableReconnection()
          .build(),
    );
    _socket!
      ..on("message", _handleMessage)
      ..onConnect(_handleConnect)
      ..onConnectError(_handleConnectionFailure)
      ..onConnectTimeout(_handleConnectionTimeout)
      ..onReconnect((_) => emit(socketReConnectEvent))
      ..connect();
  }

  void _handleMessage(data) {
    if(_socket == null) return;
    emit(socketMessageEvent, data);
  }

  void _handleConnect(_) {
    if(_socket == null) return;
    emit(socketConnectedEvent);
  }

  void _handleConnectionFailure(_) {
    if(_socket == null) return;
    emit(socketConnectionFailureEvent);
  }

  void _handleConnectionTimeout(_) {
    emit(socketConnectionTimeOutEvent);
  }

  @override
  void sendMessage(data) {
    if(_socket == null) return;
    _socket?.emit("message", data);
  }

  @override
  Future<void> disconnect() async {
    _socket?.dispose();
    _socket = null;
  }

}