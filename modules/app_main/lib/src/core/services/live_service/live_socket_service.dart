import 'package:events_emitter/emitters/event_emitter.dart';

abstract class LiveSocketService extends EventEmitter {
  Future<void> connect(String url);

  Future<void> disconnect();

  void sendMessage(dynamic data);
}
