import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:get/get.dart';

class LiveManageState {
  static int? joinLive;

  static LiveChannelController? controller;

  static RxInt hostID = 0.obs;

  static void join(int id, LiveChannelController con) {
    if (joinLive == id && controller == con) return;
    if (joinLive != null) {
      joinLive = null;
      controller?.leaveLive();
      controller = null;
    }
    joinLive = id;
    controller = con;
  }

  static void disable() {
    joinLive = null;
    controller = null;
    hostID.value = 0;
  }
}
