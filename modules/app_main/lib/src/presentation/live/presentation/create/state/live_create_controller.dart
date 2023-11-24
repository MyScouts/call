import 'package:app_main/src/core/services/live_service/live_service.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/repository/live_repository.dart';

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

    NotificationCenter.subscribe(
      channel: disposeCameraPreview,
      observer: this,
      onNotification: (_) {
        service.dispose();
      },
    );
  }

  final RxBool _isCreated = false.obs;

  RxBool get isCreated => _isCreated;

  final Rx<LiveCreateState> _state = LiveCreateState.loading.obs;

  Rx<LiveCreateState> get state => _state;

  final RxBool _isStartStream = false.obs;

  RxBool get isStartStream => _isStartStream;

  int? _id;

  int? get id => _id;

  void _initRtc() async {
    try {
      await [Permission.microphone, Permission.camera].request();
      await service.initEngine(enableMic: true, enableWebCam: true);
      await service.engine.startPreview();
      _state.value = LiveCreateState.success;
    } catch (e) {}
  }

  Future<LiveData?> createLive(Map<String, dynamic> json) async {
    final data = await repository.createNewLive(json);
    if (data != null) _id = data.id;
    return data;
  }

  void startStream() async {
    _isCreated.value = true;
    _isStartStream.value = true;
  }

  void endStartStream() {
    _isStartStream.value = false;
  }

  void dispose() {
    service.dispose();
    NotificationCenter.unsubscribe(
      channel: disposeCameraPreview,
      observer: this,
    );
  }
}
