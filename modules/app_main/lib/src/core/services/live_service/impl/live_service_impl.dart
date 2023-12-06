import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_main/src/config/app_config_service.dart';
import 'package:app_main/src/core/services/live_service/live_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LiveService)
class LiveServiceImpl extends LiveService {
  RtcEngine? _engine;



  bool _enableMic = false;

  bool _enableWebCam = false;

  @override
  Future<void> disableAudioStream() async {
    await _engine?.muteLocalAudioStream(true);
    _enableMic = false;
  }

  @override
  Future<void> disableRemoteAudioStream(int uid) async {
    await _engine?.muteRemoteAudioStream(uid: uid, mute: true);
  }

  @override
  Future<void> disableRemoteVideoStream(int uid) async {
    await _engine?.muteRemoteVideoStream(uid: uid, mute: true);
  }

  @override
  Future<void> disableVideoStream() async {
    await _engine?.muteLocalVideoStream(true);
    _enableWebCam = false;
  }

  @override
  Future dispose() async {
    if (_engine != null) {
      _engine!.leaveChannel();
      _engine!.release();
    }
    _engine = null;
  }

  @override
  Future<void> enableAudioStream() async {
    await _engine?.muteLocalAudioStream(false);
    _enableMic = true;
  }

  @override
  bool get enableMic => _enableMic;

  @override
  Future<void> enableRemoteAudioStream(int uid) async {
    await _engine?.muteRemoteAudioStream(uid: uid, mute: false);
  }

  @override
  Future<void> enableRemoteVideoStream(int uid) async {
    await _engine?.muteRemoteVideoStream(uid: uid, mute: false);
  }

  @override
  Future<void> enableVideoStream() async {
    await _engine?.muteLocalVideoStream(false);
    _enableWebCam = true;
  }

  @override
  // TODO: implement enableWebCam
  bool get enableWebCam => throw UnimplementedError();

  @override
  RtcEngine get engine => _engine!;

  @override
  Future<void> initEngine({
    bool enableMic = false,
    bool enableWebCam = false,
  }) async {
    try {
      _engine = createAgoraRtcEngine();
      await _engine!.initialize(RtcEngineContext(
        appId: AppConfigService.agoraAppID,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ));
      _enableMic = enableMic;
      _enableWebCam = enableWebCam;
      await _engine!.enableAudio();
      if (_enableMic) {
        await _engine!.enableAudioVolumeIndication(
          interval: 400,
          smooth: 3,
          reportVad: true,
        );
      }
      await _engine!.enableVideo();
      final muteLocalAudioStream = _engine!.muteLocalAudioStream(!_enableMic);
      final muteLocalVideoStream =
          _engine!.muteLocalVideoStream(!_enableWebCam);
      await Future.wait([muteLocalAudioStream, muteLocalVideoStream]);
    } catch (e) {}
  }

  @override
  Future<void> joinChannel(
    String token,
    String channelName,
    int uid, {
    ClientRoleType role = ClientRoleType.clientRoleAudience,
  }) async {
    try {
      final bool isBroadcaster = role == ClientRoleType.clientRoleBroadcaster;
      await _engine?.joinChannel(
        token: token,
        channelId: channelName,
        uid: uid,
        options: ChannelMediaOptions(
          clientRoleType: role,
          audienceLatencyLevel: isBroadcaster
              ? null
              : AudienceLatencyLevelType.audienceLatencyLevelUltraLowLatency,
          publishCameraTrack: isBroadcaster,
          publishMicrophoneTrack: isBroadcaster,
          defaultVideoStreamType: VideoStreamType.videoStreamHigh,
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> leaveChannel() async {
    if (_engine == null) return;
    await Future.wait([
      _engine!.leaveChannel(),
      _engine!.release(),
    ]);
    _engine = null;
  }

  @override
  Future startShareScreen() {
    // TODO: implement startShareScreen
    throw UnimplementedError();
  }

  @override
  Future stopShareScreen() {
    // TODO: implement stopShareScreen
    throw UnimplementedError();
  }

  @override
  Future switchCamera() async {
    await _engine!.switchCamera();
  }

  @override
  bool get isInitial => _engine != null;

  @override
  Future<void> rejoinChannel(
    String token,
    String channelName,
    int uid, {
    ClientRoleType role = ClientRoleType.clientRoleBroadcaster,
  }) async {
    await _engine!.leaveChannel();
    await joinChannel(token, channelName, uid, role: role);
  }
}
