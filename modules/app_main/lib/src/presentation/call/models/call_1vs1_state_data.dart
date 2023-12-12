import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

part 'call_1vs1_state_data.freezed.dart';

enum CallType { audio, video }

enum CallScreenState {
  none,
  incomingCall,
  makingACall,
  inCall,
  leaving,
  closed
}

@freezed
class Call1vs1StateData with _$Call1vs1StateData {
  const factory Call1vs1StateData({
    User? me,
    User? participant,
    @Default(CallType.audio) CallType callType,
    @Default(CallScreenState.none) CallScreenState screenState,
    @Default(CallState()) CallState callState,
    DateTime? startTime,
  }) = _Call1vs1StateData;
}

@freezed
class CallState with _$CallState {
  const factory CallState({
    @Default(true) bool isSpeaker,
    @Default(false) bool isEnableCamera,
    @Default(false) bool isMute,
    @Default(false) bool hasLocalTrack,
    @Default(false) bool hasPaticipantTrack,
    String? callId,
    StringeeMediaState? mediaState,
    StringeeSignalingState? signaling,
    Map<dynamic, dynamic>? callInfo,
    AudioDevice? audioDevice,
  }) = _CallState;
}
