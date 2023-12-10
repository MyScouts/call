
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

abstract class CallInfo {
  void onStatusChange(StringeeSignalingState? state) {}
  void onReceiveLocalStream(){}
  void onReceiveRemoteStream(){}
  void onMuteState(bool isMute){}
  void onSpeakerState(bool isSpeakerOn){}
  void onVideoState(bool isVideoEnable){}
}
