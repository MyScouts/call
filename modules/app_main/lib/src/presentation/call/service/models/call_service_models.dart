import 'package:app_core/app_core.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../../models/custom_call_data.dart';

class CallServiceContext {
  final StringeeClient client;
  final StringeeCall? call;
  final StringeeCall2? call2;
  final bool userCall2;
  final bool isIncomingCall;
  final String? convId;

  CallServiceContext({
    required this.client,
    StringeeCall? call,
    StringeeCall2? call2,
    required this.userCall2,
    this.convId,
  })  : isIncomingCall = userCall2 ? call2 != null : call != null,
        call = call ?? (userCall2 ? null : StringeeCall(client)),
        call2 = call2 ?? (userCall2 ? StringeeCall2(client) : null);
}

abstract class CallEvent {
  final StringeeCall2Events eventType;

  CallEvent(this.eventType);
}

class SignalingEvent extends CallEvent {
  final StringeeSignalingState state;
  SignalingEvent(
    this.state,
  ) : super(StringeeCall2Events.didChangeSignalingState);
  bool get calling => state == StringeeSignalingState.calling;
  bool get ringing => state == StringeeSignalingState.ringing;
  bool get answered => state == StringeeSignalingState.answered;
  bool get busy => state == StringeeSignalingState.busy;
  bool get ended => state == StringeeSignalingState.ended;
}

class ChangeMediaEvent extends CallEvent {
  final StringeeMediaState state;
  ChangeMediaEvent(this.state) : super(StringeeCall2Events.didChangeMediaState);
  bool get connected => state == StringeeMediaState.connected;
  bool get disconnected => state == StringeeMediaState.disconnected;
}

class ReceiveCallInfoEvent extends CallEvent {
  final String? id;
  final int? serial;
  final String? from;
  final String? to;
  final String? fromAlias;
  final String? toAlias;
  final StringeeCallType? callType;
  final CustomCallData? customDataFromYourServer;
  final bool isVideoCall;

  ReceiveCallInfoEvent(
    Map<dynamic, dynamic> callInfo,
  )   : id = asOrNull(callInfo['callId']),
        serial = asOrNull(callInfo['serial']),
        from = asOrNull(callInfo['from']),
        to = asOrNull(callInfo['to']),
        fromAlias = asOrNull(callInfo['fromAlias']),
        toAlias = asOrNull(callInfo['toAlias']),
        isVideoCall = asOrNull(callInfo['isVideoCall']),
        customDataFromYourServer = CustomCallData.fromJson(
          callInfo['customDataFromYourServer'],
        ),
        callType = asOrNull<int>(callInfo['callType'])?.let(
          (type) => StringeeCallType.values[type],
        ),
        super(StringeeCall2Events.didReceiveCallInfo);
}

class HandleOnAnotherDeviceEvent extends CallEvent {
  final StringeeSignalingState state;

  HandleOnAnotherDeviceEvent(this.state) : super(StringeeCall2Events.didHandleOnAnotherDevice);

  bool get answered => state == StringeeSignalingState.answered;
  bool get ended => state == StringeeSignalingState.ended;
  bool get busy => state == StringeeSignalingState.busy;
  bool get calling => state == StringeeSignalingState.calling; // making a call
  bool get ringing => state == StringeeSignalingState.ringing; // incoming call
}

class ReceiveCallStreamEvent extends CallEvent {
  final String callId;
  final bool isLocal;

  ReceiveCallStreamEvent(
    this.callId,
    this.isLocal,
  ) : super(StringeeCall2Events.didReceiveLocalStream);
}

enum VideoTrackAction { add, remove }

class VideoTrackEvent extends CallEvent {
  final VideoTrackAction action;
  final StringeeVideoTrack track;

  VideoTrackEvent(
    this.track,
    this.action,
  ) : super(StringeeCall2Events.didAddVideoTrack);
}

class ChangeAudioAndroidDeviceEvent extends CallEvent {
  final AudioDevice audioDevice;
  ChangeAudioAndroidDeviceEvent(this.audioDevice) : super(StringeeCall2Events.didChangeAudioDevice);

  bool get speaker => audioDevice == AudioDevice.speakerPhone;
  bool get earpiece => audioDevice == AudioDevice.earpiece;
  bool get bluetooth => audioDevice == AudioDevice.bluetooth;
  bool get wiredHeadset => audioDevice == AudioDevice.wiredHeadset;
  bool get none => audioDevice == AudioDevice.none;
}
