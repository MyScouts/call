import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/stringee/stringee_service.dart';
import 'package:app_main/src/data/repositories/user_repository.dart';
import 'package:callkeep/callkeep.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';
import 'package:uuid/uuid.dart';

import '../../../1vs1/bloc/call_1vs1_bloc.dart';
import '../../../models/call_1vs1_state_data.dart';
import '../../../stringee_bloc/stringee_bloc.dart';
import '../../call_instance/call_instance.dart';
import '../../call_instance/impl/ios_call_instance.dart';
import '../../models/call_service_models.dart';
import '../call_manager.dart';

class IOSCallManager extends CallManager {
  static IOSCallManager? _instance;

  IOSCallManager._internal();

  // ignore: prefer_constructors_over_static_methods
  static IOSCallManager get shared {
    return _instance ??= IOSCallManager._internal();
  }

  // mảng các uuid của các call được show từ callkit mà cần end
  // ngay sau khi show thành công (xử lý cho rule mới trên iOS 13)
  final _fakeCallUuids = <String?>[];
  // mảng các CallInstance đã xử lý rồi,
  // sẽ không xử lý lại nữa (xử lý cho StringeeX)
  final _oldCalls = <CallInstance?>[];
  final FlutterCallkeep callKeep = FlutterCallkeep();

  String? pushToken = '';
  bool registeredPushWithStringeeServer = false;

  Timer? _incomingCallTimeoutTimer;

  @override
  IOSCallInstance? get callInstance => super.callInstance as IOSCallInstance?;

  void configCallKeep() {
    callKeep.on(CallKeepPushKitToken(), onPushKitToken);
    callKeep.on(CallKeepDidDisplayIncomingCall(), didDisplayIncomingCall);
    callKeep.on(
        CallKeepPushKitReceivedNotification(), didReceivePushNotification);
    callKeep.on(CallKeepPerformAnswerCallAction(), answerCall);
    callKeep.on(CallKeepPerformEndCallAction(), endCall);
    callKeep.on(
        CallKeepDidPerformSetMutedCallAction(), didPerformSetMutedCallAction);
    callKeep.on(CallKeepDidActivateAudioSession(), didActivateAudioSession);

    callKeep.setup(<String, dynamic>{
      'ios': {
        'appName': 'Stringee',
      },
      'android': {
        'alertTitle': 'Permissions required',
        'alertDescription':
            'This application needs to access your phone accounts',
        'cancelButton': 'Cancel',
        'okButton': 'ok',
      },
    });
  }

  @override
  void clearDataEndDismiss() {
    endCallkit();
    deleteCallInstanceIfNeed();
    super.clearDataEndDismiss();
  }

  @override
  void showCallScreen() {
    try {
      if (context == null) {
        return;
      }

      if (appLifecycleState != AppLifecycleState.resumed ||
          callInstance?.bloc == null ||
          !callInstance!.hasStringeeCall() ||
          callInstance!.ended()) {
        return;
      }

      callInstance!.showIncomingCall(context!);
    } catch (e,s) {
      print(e);
      print(s);
    }
  }

  @override
  void handleIncomingEvent(StringeeCall call, BuildContext context) {
    super.handleIncomingEvent(call, context);
    if(callInstance?.call != null && callInstance?.call is StringeeCall2) {
      return;
    }
    // Chưa có sync call thì tạo mới
    if (callInstance?.bloc == null) {
      final bloc = Call1vs1Bloc(
        injector.get(
          param1: CallServiceContext(
            client: context.read<StringeeBloc>().state.client,
            call: call,
            userCall2: false,
          ),
        ),
        injector.get(),
        injector.get(),
        injector.get(),
        User(
          id: int.tryParse(call.from!),
        ),
        call.isVideoCall ? CallType.video : CallType.audio,
      );


      if (WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
        Future.microtask(() async {
          final userRepository = injector.get<UserRepository>();
          final caller =
              await userRepository.getUserById(id: int.parse(call.from!));

          // Show callkit

          var uuid = await callKeep.reportCallIfNeeded(call.id!, call.fromAlias ?? call.from ?? "");

          callInstance = IOSCallInstance(
            bloc,
            uuid
          );
        });
      }

      listenCallBlocEnded(bloc);

      // Show callScreen
      showCallScreen();

      call.initAnswer().then((result) {
        stringeeLog('initAnswer: ${result['message']}');
        if (result['status'] != true) {
          clearDataEndDismiss();
        } else {
          callInstance!.answerIfConditionPassed();
        }
      });

      return;
    }

    // Cuộc gọi mới không phải là cuộc gọi đang xử lý thì reject
    if (!callInstance!.isThisCall(call.id, call.serial)) {
      stringeeLog('Cuộc gọi mới không phải là cuộc gọi đang xử lý thì reject');
      call.reject();
      return;
    }

    // Người dùng đã click reject cuộc gọi thì reject
    if (callInstance!.userRejected) {
      stringeeLog('Người dùng đã click reject cuộc gọi thì reject');
      call.reject();
      return;
    }

    showCallScreen();

    call.initAnswer();
    callInstance!.answerIfConditionPassed();
  }

  @override
  void handleIncomingEvent2(StringeeCall2 call, BuildContext context) {
    super.handleIncomingEvent2(call, context);

    if(callInstance?.call != null && callInstance?.call is StringeeCall) {
      return;
    }
    // Chưa có sync call thì tạo mới
    if (callInstance?.bloc == null) {
      final bloc = Call1vs1Bloc(
        injector.get(
          param1: CallServiceContext(
            client: context.read<StringeeBloc>().state.client,
            call2: call,
            userCall2: true,
          ),
        ),
        injector.get(),
        injector.get(),
        injector.get(),
        User(
          id: int.tryParse(call.from!),
        ),
        call.isVideoCall ? CallType.video : CallType.audio,
      );

      if (WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
        Future.microtask(() async {
          final userRepository = injector.get<UserRepository>();
          final caller =
          await userRepository.getUserById(id: int.parse(call.from!));

          var uuid = await callKeep.reportCallIfNeeded(call.id!, call.fromAlias ?? call.from ?? "");

          callInstance = IOSCallInstance(
              bloc,
              uuid
          );
        });
      }

      listenCallBlocEnded(bloc);

      // Show callScreen
      showCallScreen();

      call.initAnswer().then((result) {
        stringeeLog('initAnswer: ${result['message']}');
        if (result['status'] != true) {
          clearDataEndDismiss();
        } else {
          callInstance!.answerIfConditionPassed();
        }
      });

      return;
    }

    // Cuộc gọi mới không phải là cuộc gọi đang xử lý thì reject
    if (!callInstance!.isThisCall(call.id, call.serial)) {
      stringeeLog('Cuộc gọi mới không phải là cuộc gọi đang xử lý thì reject');
      call.reject();
      return;
    }

    // Người dùng đã click reject cuộc gọi thì reject
    if (callInstance!.userRejected) {
      stringeeLog('Người dùng đã click reject cuộc gọi thì reject');
      call.reject();
      return;
    }

    showCallScreen();

    call.initAnswer();
    callInstance!.answerIfConditionPassed();
  }

  @override
  void setOutgoingCall(Call1vs1Bloc bloc) {
    super.setOutgoingCall(bloc);
    callInstance = IOSCallInstance(
      bloc,
      _genUUID(),
    );
    callInstance!.callScreenShowed = true;
  }

  void registerPushWithStringeeServer() {
    if (registeredPushWithStringeeServer) {
      return;
    }

    if (pushToken == null || pushToken!.isEmpty) {
      stringeeLog('Push token khong hop le');
      return;
    }

    final client = context?.read<StringeeBloc>().state.client;
    if (client == null || !client.hasConnected) {
      return;
    }
    client
        .registerPush(
      pushToken!,
      isProduction: true,
      isVoip: true,
    )
        .then((result) {
      final status = result['status'];
      final message = result['message'];
      stringeeLog('Result for resgister push: $message');
      if (status) {
        registeredPushWithStringeeServer = true;
      }
    });
  }

  String _genUUID() {
    return const Uuid().v4();
  }

  void showFakeCall() {
    /*
      Rule mới của Apple trên iOS 13 là bắt buộc show Callkit 
      khi nhận được push từ Pushkit.
      Trong một số trường hợp call không hợp lệ lẽ ra không xử lý 
      nhưng vẫn cần show callkit.
      => Phương án: show lên 1 call đến callkit show đó end call luôn.
      Note: Thực hiện end fake call trong callback 'didDisplayIncomingCall'
    **/
    final fakeCallUuid = _genUUID();
    callKeep.displayIncomingCall(
      fakeCallUuid,
      'Stringee',
      localizedCallerName: 'Call Ended',
    );
    _fakeCallUuids.add(fakeCallUuid);
  }

  void endFakeCall(String? uuid) {
    if (_fakeCallUuids.contains(uuid)) {
      callKeep.endCall(uuid!);
      _fakeCallUuids.remove(uuid);
      stringeeLog('End fake call voi uuid: $uuid');
    }
  }

  void saveCallInstanceToHandledCallList(CallInstance? call) {
    _oldCalls.removeWhere(
      (element) =>
          element!.callId == call!.callId && element.serial == call.serial,
    );
    _oldCalls.add(call);
  }

  void removeCallInstanceFromHandledCallList(String callId, int? serial) {
    _oldCalls.removeWhere(
      (element) => element!.callId == callId && element.serial == serial,
    );
  }

  bool checkIfCallIsHandledOrNot(String callId, int? serial) {
    for (final CallInstance? loopCall in _oldCalls) {
      if (loopCall!.callId == callId && loopCall.serial == serial) {
        return true;
      }
    }

    return false;
  }

  void deleteCallInstanceIfNeed() {
    if (callInstance?.bloc == null) {
      stringeeLog('CallInstance is deleted');
      return;
    }

    if (callInstance!.ended()) {
      saveCallInstanceToHandledCallList(callInstance);
      callInstance = null;
    } else {
      stringeeLog(
          '''deleteCallInstanceIfNeed failed, endedCallkit: ${callInstance!.endedCallkit} endedStringeeCall: ${callInstance!.endedStringeeCall}''');
    }
  }

  void endCallkit() {
    callKeep.endAllCalls();
  }

  /*
    Handle cho truong hop A goi B, nhung A end call rat nhanh,
    B nhan duoc push nhung khong nhan duoc incoming call
    ==> Sau khi ket noi den Stringee server 3s ma chua nhan
    duoc cuoc goi den thi xoa Callkit Call va syncCall
  **/
  void startTimeoutForIncomingCall() {
    if (_incomingCallTimeoutTimer != null || callInstance?.bloc == null) {
      return;
    }

    Timer(const Duration(seconds: 3), () {
      if (callInstance?.bloc == null) {
        return;
      }

      if (!callInstance!.hasStringeeCall()) {
        callInstance!.endedStringeeCall = true;
        callKeep.endAllCalls();
        saveCallInstanceToHandledCallList(callInstance);
        callInstance = null;
      }
    });
  }

  void stopTimeoutForIncomingCall() {
    if (_incomingCallTimeoutTimer != null) {
      _incomingCallTimeoutTimer!.cancel();
      _incomingCallTimeoutTimer = null;
    }
  }

  /// Setup callkeep
  ///

  void onPushKitToken(CallKeepPushKitToken event) {
    // Nhận được token của Apple => Register với StringeeServer
    stringeeLog('[onPushKitToken] token => ${event.token}');
    pushToken = event.token;
    registerPushWithStringeeServer();
  }

  Future<void> didReceivePushNotification(
    CallKeepPushKitReceivedNotification event,
  ) async {
    stringeeLog(
        '''CallKeepPushKitReceivedNotification, callId: ${event.callId}, callStatus: ${event.callStatus}, uuid: ${event.uuid}, serial: ${event.serial},''');
    final callId = event.callId!;
    final uuid = event.uuid;
    final serial = event.serial;

    if (uuid == null) {
      return;
    }
    

    // Chưa có sync call (Trường hợp cuộc gọi mới)
    // => tạo sync call và lưu lại thông tin
    if (callInstance?.bloc == null) {
      stringeeLog(
        'handleIncomingPushNotification, CallInstance: $callInstance',
      );

      callInstance = IOSCallInstance(
        null,
        uuid,
        callId,
        serial,
      );
      startTimeoutForIncomingCall();
      return;
    }

    // Đã có sync call nhưng là của cuộc gọi khác
    // => end callkit này (callkit vừa được show bên native)
    if (!callInstance!.isThisCall(callId, serial)) {
      stringeeLog(
        'END CALLKIT KHI NHAN DUOC PUSH, PUSH MOI KHONG PHAI SYNC CALL',
      );
      // _callKit.endCall(uuid);
      await callKeep.endCall(uuid);
      return;
    }

    // Đã có sync call, thông tin cuộc gọi là trùng khớp,
    // nhưng đã show callkit rồi => end callkit vừa show
    if (callInstance!.showedCallkit() && callInstance!.uuid != uuid) {
      stringeeLog('END CALLKIT KHI NHAN DUOC PUSH, SYNC CALL DA SHOW CALLKIT');
      // _callKit.endCall(uuid);
      await callKeep.endCall(uuid);
    }
  }

  void didDisplayIncomingCall(CallKeepDidDisplayIncomingCall event) {
    stringeeLog(
        '''didDisplayIncomingCall, callId: ${event.callId}, uuid: ${event.uuid}, serial: ${event.serial}''');
    endFakeCall(event.uuid);
    deleteCallInstanceIfNeed();
  }

  Future<void> answerCall(CallKeepPerformAnswerCallAction event) async {
    // Called when the user answers an incoming call
    stringeeLog('performAnswerCallAction, uuid: ${event.callUUID}');
    if (callInstance!.uuid.isEmpty || callInstance!.uuid != event.callUUID) {
      return;
    }
    callInstance!.userAnswered = true;
    callInstance!.answerIfConditionPassed();
  }

  Future<void> endCall(CallKeepPerformEndCallAction event) async {
    stringeeLog('performEndCallAction, uuid: ${event.callUUID} ');
    /*
       Được gọi khi người dùng reject (ngắt ở màn hình cuộc gọi đến) 
       hoặc hangup (ngắt ở màn hình cuộc gọi đang diễn ra) 
       cuộc gọi từ màn hỉnh callkit
       => Cần kiểm tra điều kiện để biết nên gọi hàm reject hay hangup 
       của StringeeCall object. 2 hàm này có ý nghĩa khác nhau.
       **/
    if (callInstance?.bloc == null ||
        callInstance!.uuid.isEmpty ||
        callInstance!.uuid != event.callUUID) {
      return;
    }

    callInstance!.endedCallkit = true;
    callInstance!.userRejected = true;

    if (callInstance!.hasStringeeCall() &&
        callInstance!.signalingState != StringeeSignalingState.busy &&
        callInstance!.signalingState != StringeeSignalingState.ended) {
      // Nếu StringeeCall đã được answer
      // thì gọi hàm hangup() nếu chưa thì reject()
      if (callInstance!.callAnswered) {
        await callInstance!.hangup();
      } else {
        await callInstance!.reject();
      }
    }

    deleteCallInstanceIfNeed();
  }

  Future<void> didPerformSetMutedCallAction(
    CallKeepDidPerformSetMutedCallAction event,
  ) async {
    // Called when the system or user mutes a call
    if (callInstance?.bloc == null) {
      return;
    }

    callInstance!.mute(
      event.muted == true,
    );
  }

  void didActivateAudioSession(CallKeepDidActivateAudioSession event) {
    stringeeLog('didActivateAudioSession, CallInstance: $CallInstance');
    if (callInstance?.bloc == null) {
      return;
    }
    callInstance!.audioSessionActived = true;
    callInstance!.answerIfConditionPassed();
  }
}
