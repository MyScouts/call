
import 'package:socket_io_client/socket_io_client.dart';

class ChatSocketIo {
  late final Socket _socket;

  init() {
    _socket = io('https://s1.netfiin.vn/', OptionBuilder().setTransports(['websocket']).build());
    _socket.onConnect((data) {
      print("connected");
    });
  }

  void ok() {

  }

  Socket get socket => _socket;
}