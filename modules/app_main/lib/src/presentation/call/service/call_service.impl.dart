part of 'call_service.dart';

@Injectable(as: Call1vs1Service)
class Call1vs1ServiceImpl extends Call1vs1Service {
  bool callMsgSent = false;

  Call1vs1ServiceImpl(
    @factoryParam super.context,
  );

  final _callEventStreamCtrl = StreamController<CallEvent>.broadcast();

  @override
  Stream<CallEvent> get callEventStream => _callEventStreamCtrl.stream;

  @override
  void initCall() {
    // Listen events
    stringeeLog('initCall');

    call.eventStreamController.stream.listen((event) {
      final Map<dynamic, dynamic> map = event;
      stringeeLog('CallService ${map.toString()}');

      switch (map['eventType']) {
        case StringeeCall2Events.didChangeSignalingState:
          handleSignalingStateChangeEvent(map['body']);
          break;
        case StringeeCall2Events.didChangeMediaState:
          handleMediaStateChangeEvent(map['body']);
          break;
        case StringeeCall2Events.didReceiveCallInfo:
          handleReceiveCallInfoEvent(map['body']);
          break;
        case StringeeCall2Events.didHandleOnAnotherDevice:
          handleHandleOnAnotherDeviceEvent(map['body']);
          break;
        case StringeeCall2Events.didReceiveLocalStream:
          handleReceiveLocalStreamEvent(map['body']);
          break;
        case StringeeCall2Events.didReceiveRemoteStream:
          handleReceiveRemoteStreamEvent(map['body']);
          break;
        case StringeeCall2Events.didAddVideoTrack:
          handleAddVideoTrackEvent(map['body']);
          break;
        case StringeeCall2Events.didRemoveVideoTrack:
          handleRemoveVideoTrackEvent(map['body']);
          break;

        /// This event only for android
        case StringeeCall2Events.didChangeAudioDevice:
          if (Platform.isAndroid) {
            handleChangeAudioAndroidDeviceEvent(map['selectedAudioDevice']);
          }
          break;
      }
    });
  }

  @override
  Future<bool?> initAnswer() {
    return call.initAnswer().then((event) {
      stringeeLog('answer: $event');

      return event['status'];
    });
  }

  @override
  Future<bool?> answerCall() async {
    if (!isIncomingCall) {
      return Future.value(false);
    }

    final res = await call.answer();

    stringeeLog('answer: $res');

    final status = res['status'];

    if (status == true) {
      return status;
    }
    throw Exception(res['message']);
  }

  @override
  Future<bool?> makeCall(MakeCallParams params) async {
    _makeCallParams = params;
    if (isIncomingCall) {
      stringeeLog('makeCall with isIncomingCall: $isIncomingCall');
      return Future.value(false);
    }
    stringeeLog('request make a call');
    final event = await call.makeCallFromParams(params);
    return event['status'];
  }

  @override
  Future<bool?> hangup() async {
    stringeeLog('request hangup call');
    final event = await call.hangup();
    return event['status'];
  }

  @override
  Future<bool?> reject() async {
    stringeeLog('request reject call');
    final event = await call.reject();
    return event['status'];
  }

  @override
  Future<bool?> mute(bool isMute) async {
    stringeeLog('request mute call: $isMute');
    final event = await call.mute(isMute);
    stringeeLog('mute: $event');
    return event['status'];
  }

  @override
  Future<bool?> setSpeakerphoneOn(bool isSpeaker) async {
    stringeeLog('request setSpeakerphoneOn call: $isSpeaker');
    final event = await call.setSpeakerphoneOn(isSpeaker);
    return event['status'];
  }

  @override
  Future<bool?> switchCamera() async {
    stringeeLog('request switchCamera');
    final event = await call.switchCamera();
    stringeeLog('switchCamera: $event');
    return event['status'];
  }

  @override
  Future<bool?> enableVideo(bool isEnabled) async {
    stringeeLog('request enableVideo call: $isEnabled');
    final event = await call.enableVideo(isEnabled);
    stringeeLog('enableVideo: $event');
    return event['status'];
  }

  void handleSignalingStateChangeEvent(StringeeSignalingState state) {
    final event = SignalingEvent(state);
    if (event.answered) {
      _startTime = DateTime.now();
    }
    _callEventStreamCtrl.add(SignalingEvent(state));
    if (event.ended || event.busy) {
      handleCallEnded();
    }
  }

  void handleMediaStateChangeEvent(StringeeMediaState state) {
    _callEventStreamCtrl.add(ChangeMediaEvent(state));
  }

  void handleReceiveCallInfoEvent(Map<dynamic, dynamic> info) {
    _callEventStreamCtrl.add(ReceiveCallInfoEvent(info));
  }

  void handleHandleOnAnotherDeviceEvent(StringeeSignalingState state) {
    _callEventStreamCtrl.add(HandleOnAnotherDeviceEvent(state));
  }

  void handleReceiveLocalStreamEvent(String callId) {
    _callEventStreamCtrl.add(ReceiveCallStreamEvent(callId, true));
  }

  void handleReceiveRemoteStreamEvent(String callId) {
    _callEventStreamCtrl.add(ReceiveCallStreamEvent(callId, false));
  }

  void handleAddVideoTrackEvent(StringeeVideoTrack track) {
    _callEventStreamCtrl.add(VideoTrackEvent(track, VideoTrackAction.add));
  }

  void handleRemoveVideoTrackEvent(StringeeVideoTrack track) {
    _callEventStreamCtrl.add(VideoTrackEvent(track, VideoTrackAction.remove));
  }

  void handleChangeAudioAndroidDeviceEvent(AudioDevice audioDevice) {
    _callEventStreamCtrl.add(ChangeAudioAndroidDeviceEvent(audioDevice));
  }

  Future<bool> handleCallEnded() async {
    await _callEventStreamCtrl.close();

    stringeeLog(
      'handleCallEnded: $isIncomingCall $_makeCallParams',
    );
    return false;
  }
}
