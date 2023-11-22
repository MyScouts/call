import 'package:app_main/src/core/services/live_service/live_service.dart';
import 'package:app_main/src/core/services/live_service/live_socket_service.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

enum LiveStreamState {
  loading,
  preview,
  watching,
  stop;

  bool get isLoading => this == LiveStreamState.loading;

  bool get isPreview => this == LiveStreamState.preview;

  bool get isWatching => this == LiveStreamState.watching;

  bool get isStop => this == LiveStreamState.stop;
}

@injectable
class LiveChannelController {
  final LiveService service;
  final LiveSocketService socketService;

  LiveChannelController(this.service, this.socketService);

  final Rx<LiveStreamState> _state = LiveStreamState.loading.obs;

  Rx<LiveStreamState> get state => _state;

  Future setup() async {
    try {
      await service.initEngine(enableMic: true, enableWebCam: true);
    } catch (e) {}
  }
}
