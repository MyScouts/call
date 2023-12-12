import 'package:app_main/src/core/services/stringee/stringee_service.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../../../1vs1/bloc/call_1vs1_bloc.dart';
import '../call_instance.dart';

class IOSCallInstance extends CallInstance {
  IOSCallInstance(
    super.callService,
    this.uuid, [
    String? callId,
    int? serial,
  ])  : _callId = callId,
        _serial = serial;

  final String uuid;

  final String? _callId;
  final int? _serial;

  @override
  String? get callId => _callId ?? super.callId;

  @override
  int? get serial => _serial ?? super.serial;

  bool userRejected = false;

  /// Người dùng đã click và nút answer ở màn hình
  /// incoming call của callkit hoặc của app
  bool userAnswered = false;

  /// StringeeCall đã được answer
  /// (đã gọi hàm answer của StringeeCall object)
  bool callAnswered = false;

  /// AudioSession của iOS đã được active
  /// thì khi answer call của Stringee mới kết nối thoại được
  bool audioSessionActived = false;

  bool endedCallkit = false;
  bool endedStringeeCall = false;

  // Thêm biến này để check nếu là lần đầu media connected
  // thì nếu là cuộc gọi video sẽ cho audio ra loa ngoài
  bool mediaFirstTimeConnected = false;

  bool showedCallkit() {
    return uuid.isNotEmpty;
  }

  @override
  void dispose() {
    super.dispose();

    userRejected = false;
    userAnswered = false;
    callAnswered = false;
    audioSessionActived = false;
    endedCallkit = false;
    endedStringeeCall = false;
  }

  void answerIfConditionPassed() {
    /*
      Voi iOS, Answer StringeeCall khi thoa man cac yeu to:
      1. Da nhan duoc su kien incomingCall (có StringeeCall object) 
      hoac incomingCall2 (co StringeeCall2 object)
      2. User da click answer
      3. Chua goi ham answer cua StringeeCall lan nao
      4. AudioSession da active
    **/
    if (bloc == null ||
        !userAnswered ||
        callAnswered ||
        !audioSessionActived ||
        call == null) {
      stringeeLog(
          '''answerIfConditionPassed, condition has not been passed, userAnswered: $userAnswered, callAnswered: $callAnswered, audioSessionActived: $audioSessionActived''');
      return;
    }

    if (!bloc!.state.isInCall) {
      userAnswered = true;
      callAnswered = true;
      bloc!.add(AnswerCallEvent());
    }
  }

  bool isThisCall(String? callId, int? serial) {
    return this.callId == callId && this.serial == serial;
  }

  @override
  bool ended() {
    if (signalingState == StringeeSignalingState.busy ||
        signalingState == StringeeSignalingState.ended) {
      return true;
    }
    bool callkitEndStatus = false;
    if (uuid.isEmpty) {
      callkitEndStatus = true;
    } else {
      callkitEndStatus = endedCallkit;
    }

    return callkitEndStatus && endedStringeeCall;
  }

  void routeAudioToSpeakerIfNeed() {
    if (mediaFirstTimeConnected || bloc == null) {
      return;
    }

    if (call != null && call!.isVideoCall) {
      mediaFirstTimeConnected = true;
      bloc!.add(ToggleSpeakerEvent(true));
    }
  }

  Future hangup() async {
    if (bloc != null) {
      bloc!.add(CloseCallEvent());
    }
  }

  Future reject() async {
    if (bloc != null) {
      bloc!.add(CloseCallEvent());
    }
  }

  void mute(bool muted) {
    if (bloc != null) {
      bloc!.add(ToggleMicEvent(muted));
    }
  }
}
