import 'package:app_main/src/core/services/live_service/live_service.dart';
import 'package:app_main/src/data/repositories/live_repository.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

enum LiveCreateState {
  loading,
  success;
}

@injectable
class LiveCreateController {
  final LiveRepository repository;
  final LiveService service;

  LiveCreateController(this.repository, this.service) {
    _initRtc();
  }

  final RxBool _isCreated = false.obs;

  RxBool get isCreated => _isCreated;

  final Rx<LiveCreateState> _state = LiveCreateState.loading.obs;

  Rx<LiveCreateState> get state => _state;

  void _initRtc() async {
    await [Permission.microphone, Permission.camera].request();
    await service.initEngine(enableMic: true, enableWebCam: true);
    await service.engine.startPreview();
    _state.value = LiveCreateState.success;
  }
}
