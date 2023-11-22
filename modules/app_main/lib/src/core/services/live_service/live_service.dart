import 'package:agora_rtc_engine/agora_rtc_engine.dart';

abstract class LiveService {
  RtcEngine get engine;

  bool get enableMic;

  bool get enableWebCam;

  Future<void> initEngine({
    bool enableMic = false,
    bool enableWebCam = false,
  });

  Future dispose();

  Future<void> joinChannel(
    String token,
    String channelName,
    int uid, {
    ClientRoleType role = ClientRoleType.clientRoleBroadcaster,
  });

  Future<void> leaveChannel();

  Future<void> enableAudioStream();

  Future<void> disableAudioStream();

  Future<void> disableRemoteAudioStream(int uid);

  Future<void> enableRemoteAudioStream(int uid);

  Future<void> enableVideoStream();

  Future<void> disableVideoStream();

  Future<void> enableRemoteVideoStream(int uid);

  Future<void> disableRemoteVideoStream(int uid);

  Future startShareScreen();

  Future stopShareScreen();

  Future switchCamera();
}
