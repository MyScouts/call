// ignore_for_file: unused_field

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/call/new_call_payload.dart';
import 'package:app_main/src/data/models/payloads/call/update_call_payload.dart';
import 'package:app_main/src/domain/entities/call/result_response_model.dart';
import 'package:app_main/src/domain/usecases/call_usecase.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../../../../domain/usecases/user_share_preferences_usecase.dart';
import '../../../../domain/usecases/user_usecase.dart';
import '../../models/call_1vs1_state_data.dart';
import '../../models/custom_call_data.dart';
import '../../service/call_manager/impl/android_call_manager.dart';
import '../../service/call_manager/impl/ios_call_manager.dart';
import '../../service/call_service.dart';
import '../../service/models/call_service_models.dart';

part 'call_1vs1_event.dart';
part 'call_1vs1_state.dart';

Stream<T> singleEventTransformer<T>(
  Stream<T> events,
  EventMapper<T> mapper,
) {
  return events.exhaustMap(mapper);
}

class Call1vs1Bloc extends Bloc<Call1vs1Event, Call1vs1State> {
  final Call1vs1Service _call1vs1Service;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;
  final UserUsecase _userUsecase;
  final CallUseCase _callUseCase;
  bool needUpdateCall = false;
  int status = 1;

  late StreamSubscription<CallEvent> _onListenerCallEvent;

  get call => _call1vs1Service.call;
  // StringeeCall2? get call2 => _call1vs1Service.call2;

  StringeeClient? get client => _call1vs1Service.client;

  ResultResponseModel? response;

  Call1vs1Bloc(
    this._call1vs1Service,
    this._userSharePreferencesUsecase,
    this._userUsecase,
    this._callUseCase,
    User? participant,
    CallType? callType,
  ) : super(Call1vs1StateInitial(
          data: Call1vs1StateData(
            me: _userSharePreferencesUsecase.getUserInfo(),
            participant: participant,
            callType: callType ?? CallType.audio,
            callState: CallState(
              isSpeaker: (callType ?? CallType.audio) != CallType.audio,
              isEnableCamera: (callType ?? CallType.audio) != CallType.audio,
            ),
            screenState: _call1vs1Service.isIncomingCall
                ? CallScreenState.incomingCall
                : CallScreenState.makingACall,
          ),
        )) {
    on<ConnectToCallEvent>(
      _onConnectToCallEvent,
      transformer: singleEventTransformer,
    );
    on<NotifyCallingErrorEvent>(_onNotifyCallingErrorEvent);
    on<CloseCallEvent>(
      _onCloseCallEvent,
      transformer: singleEventTransformer,
    );
    on<HandleCallStateChangedEvent>(_onHandleCallStateChangedEvent);
    on<AnswerCallEvent>(
      _onAnswerCallEvent,
      transformer: singleEventTransformer,
    );
    on<ToggleMicEvent>(
      _onToggleMicEvent,
      transformer: singleEventTransformer,
    );
    on<ToggleSpeakerEvent>(
      _onToggleSpeakerEvent,
      transformer: singleEventTransformer,
    );
    on<EnableCameraEvent>(
      _onEnableCameraEvent,
      transformer: singleEventTransformer,
    );
    on<SwitchCameraEvent>(
      _onSwitchCameraEvent,
      transformer: singleEventTransformer,
    );

    _onListenerCallEvent = _call1vs1Service.callEventStream.listen((callEvent) {
      add(HandleCallStateChangedEvent(callEvent));
    });

    add(ConnectToCallEvent());

    createCallId(callType ?? CallType.audio, participant);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(NotifyCallingErrorEvent(error, stackTrace));
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    try {
      _onListenerCallEvent.cancel();
    } catch (_) {}
    _call1vs1Service.dispose();

    return super.close();
  }

  ////////////////////////////////////////////////////////////////
  ///  ======>  HANDLE CALL CONNECTION
  ////////////////////////////////////////////////////////////////
  FutureOr<void> _onConnectToCallEvent(
      ConnectToCallEvent event, Emitter<Call1vs1State> emit) async {
    _call1vs1Service.initCall();

    if (_call1vs1Service.isIncomingCall) {
      // Case incoming call
      log({
        'where': 'incoming call',
        'data': _call1vs1Service.call.customDataFromYourServer
      }.toString());

      final participant =
          await int.tryParse(_call1vs1Service.call.from ?? '')?.let(
        _userUsecase.geSynctUserById,
      );

      emit(state.copyWith(
        data: state.data.copyWith(
          participant: participant,
          screenState: CallScreenState.incomingCall,
          callState: state.callState.copyWith(callId: _call1vs1Service.call.id),
        ),
      ));
    } else {
      if ([
        state.me?.id,
        state.participant?.id,
      ].every((e) => e != null)) {
        final participant = await _userUsecase.geSynctUserById(
          state.participant!.id!,
        );
        if (participant == null) {
          throw Exception('Can`t get participant info');
        }
        emit(
          state.copyWith(
            data: state.data.copyWith(
              participant: participant,
              screenState: CallScreenState.makingACall,
            ),
          ),
        );

        if (Platform.isAndroid) {
          AndroidCallManager.shared.setOutgoingCall(this);
        } else {
          IOSCallManager.shared.setOutgoingCall(this);
        }

        final res = await _call1vs1Service.makeCall(MakeCallParams(
          state.me!.id.toString(),
          participant.id.toString(),
          customData: CustomCallData(
            caller: state.me!.toCallUser,
            callee: participant.toCallUser,
          ).toJson(),
          videoQuality: VideoQuality.hd,
          isVideoCall: state.callType == CallType.video,
        ));
        if (res != true) {
          throw Exception('Can`t making a call at this time');
        } else {
          emit(
            state.copyWith(
              data: state.data.copyWith(
                callState: state.callState.copyWith(
                  callId: _call1vs1Service.call.id,
                  hasLocalTrack: _call1vs1Service.call.isVideoCall,
                  hasPaticipantTrack: false,
                ),
              ),
            ),
          );
        }
      } else {
        throw Exception('Paticipant could not be found!');
      }
    }
  }

  FutureOr<void> _onNotifyCallingErrorEvent(
      NotifyCallingErrorEvent event, Emitter<Call1vs1State> emit) {
    if (event.error is Exception) {
      emit(state.copyWith<CallingErrorState>(
        errorMessage: (event.error as Exception).toString(),
      ));
    }
  }

  ////////////////////////////////////////////////////////////////
  ///  ======>  HANDLE CALL FUNCTION
  ////////////////////////////////////////////////////////////////

  FutureOr<void> _onHandleCallStateChangedEvent(
      HandleCallStateChangedEvent event, Emitter<Call1vs1State> emit) {
    if (state.isCallClosed) {
      //DO NOTHING
      return Future.value();
    }
    final callEvent = event.callEvent;
    var data = state.data;
    var callState = state.callState;

    if (callEvent is SignalingEvent) {
      // Handle SignalingEvent

      if (callEvent.answered) {
        if (_call1vs1Service.isIncomingCall && !state.isInCall) {
          // In case another device picked phone up
          data = state.data.copyWith(
            screenState: CallScreenState.closed,
          );
        } else {
          data = state.data.copyWith(
            startTime: DateTime.now(),
            screenState: CallScreenState.inCall,
          );
        }
      } else if (callEvent.busy || callEvent.ended) {
        status = 3;
        data = state.data.copyWith(
          screenState: CallScreenState.closed,
        );
      } else {}
    } else if (callEvent is ChangeAudioAndroidDeviceEvent) {
      // Handle ChangeAudioAndroidDeviceEvent

      if (callEvent.speaker || callEvent.earpiece) {
        _call1vs1Service.setSpeakerphoneOn(state.callState.isSpeaker);
      } else if (callEvent.bluetooth || callEvent.wiredHeadset) {
        callState = state.callState.copyWith(isSpeaker: false);
        _call1vs1Service.setSpeakerphoneOn(false);
      }
    } else if (callEvent is ReceiveCallStreamEvent) {
      // Handle ReceiveCallStreamEvent

      callState = state.callState.copyWith(
        callId: callEvent.callId,
        hasLocalTrack: callEvent.isLocal || state.callState.hasLocalTrack,
        hasPaticipantTrack:
            !callEvent.isLocal || state.callState.hasPaticipantTrack,
      );
    } else if (callEvent is ChangeMediaEvent && callEvent.connected) {
      _call1vs1Service.setSpeakerphoneOn(state.callState.isSpeaker);
    }
    emit(
      state.copyWith(
        data: data.copyWith(
          callState: callState,
        ),
      ),
    );
  }

  Future<void> _onCloseCallEvent(
      CloseCallEvent event, Emitter<Call1vs1State> emit) async {
    await _onListenerCallEvent.cancel();
    if (state.isMakingACall) {
      status = 3;
    } else if (state.isCallClosed) {
      status = status == 3 ? 3 : 2;
    }
    if (state.isIncomingCall) {
      _call1vs1Service.reject();
    } else if (state.isInCall || state.isMakingACall || state.isLeaving) {
      _call1vs1Service.hangup();
    }

    updateCall();

    emit(state.copyWith<Call1vs1StateInitial>(
      data: state.data.copyWith(
        screenState: CallScreenState.closed,
      ),
    ));
  }

  Future<void> _onAnswerCallEvent(
      AnswerCallEvent event, Emitter<Call1vs1State> emit) async {
    emit(
      state.copyWith(
        data: state.data.copyWith(
          startTime: DateTime.now(),
          screenState: CallScreenState.inCall,
        ),
      ),
    );
    if ((await _call1vs1Service.answerCall()) == true) {
      if (_call1vs1Service.call.isVideoCall) {
        add(EnableCameraEvent(enable: true));
      }
    }
  }

  Future<void> _onToggleMicEvent(
      ToggleMicEvent event, Emitter<Call1vs1State> emit) async {
    var isMute = state.callState.isMute;
    if (event.muted != null) {
      // case force isMute
      // do revese force isMute such as old state
      isMute = !event.muted!;
    }
    emit(
      state.copyWith(
        data: state.data.copyWith(
          callState: state.callState.copyWith(isMute: !isMute),
        ),
      ),
    );
    final res = (await _call1vs1Service.mute(!isMute)) == true;
    emit(
      state.copyWith(
        data: state.data.copyWith(
          callState: state.callState.copyWith(
            isMute: res ? !isMute : isMute,
          ),
        ),
      ),
    );
  }

  Future<void> _onToggleSpeakerEvent(
      ToggleSpeakerEvent event, Emitter<Call1vs1State> emit) async {
    var isSpeaker = state.callState.isSpeaker;
    if (event.isSpeaker != null) {
      // case force isSpeaker
      // do revese force isSpeaker such as old state
      isSpeaker = !event.isSpeaker!;
    }
    emit(
      state.copyWith(
        data: state.data.copyWith(
          callState: state.callState.copyWith(isSpeaker: !isSpeaker),
        ),
      ),
    );
    final res = (await _call1vs1Service.setSpeakerphoneOn(!isSpeaker)) == true;
    emit(
      state.copyWith(
        data: state.data.copyWith(
          callState: state.callState.copyWith(
            isSpeaker: res ? !isSpeaker : isSpeaker,
          ),
        ),
      ),
    );
  }

  Future<void> _onEnableCameraEvent(
      EnableCameraEvent event, Emitter<Call1vs1State> emit) async {
    final enabled = event.enable ?? !state.callState.isEnableCamera;
    emit(
      state.copyWith(
        data: state.data.copyWith(
          callType: CallType.video,
          callState: state.callState.copyWith(isEnableCamera: enabled),
        ),
      ),
    );

    final res = (await _call1vs1Service.enableVideo(enabled)) == true;
    emit(
      state.copyWith(
        data: state.data.copyWith(
          callState: state.callState.copyWith(
            isEnableCamera: res ? enabled : !enabled,
          ),
        ),
      ),
    );
  }

  FutureOr<void> _onSwitchCameraEvent(
      SwitchCameraEvent event, Emitter<Call1vs1State> emit) {
    _call1vs1Service.switchCamera();
  }

  Future<void> createCallId(CallType callType, User? participant) async {
    if (!_call1vs1Service.isIncomingCall) {
      response = await _callUseCase.newCall(
          payload: NewCallPayload(
        receiverId: participant?.id ?? 0,
        type: callType == CallType.audio ? 1 : 2,
      ));
      needUpdateCall = true;
    }
  }

  Future<void> updateCall() async {
    if (needUpdateCall) {
      await _callUseCase.updateCall(
          payload: UpdateCallPayload(
              type: state.callType == CallType.audio ? 1 : 2, status: status),
          callId: response?.result ?? 0);
      needUpdateCall = false;
    }
  }
}
