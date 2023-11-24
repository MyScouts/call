import 'package:events_emitter/emitters/event_emitter.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class LiveSocketService extends EventEmitter {
  io.Socket get socket;

  Future<void> connect(
    String url, {
    required String token,
    String? deviceId,
  });

  Future<void> disconnect();

  void sendMessage(dynamic data);
}
