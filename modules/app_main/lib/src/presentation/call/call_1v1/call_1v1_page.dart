//import 'dart:developer' as developer;
import 'dart:async';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/call/new_call_payload.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/call/call_info.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/call/call_1v1/cubit/call_state.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/call_manager.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:pulsator/pulsator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';
import 'package:ui/ui.dart';

import 'cubit/call_cubit.dart';
import 'managers/sync_call.dart';

class Call1V1Page extends StatefulWidget {
  final String? fromUserId;
  final String? toUserId;
  bool isVideo;
  bool useCall2;
  final bool incomingUI;

  static const routeName = 'Call1V1Page';

  Call1V1Page({
    super.key,
    required this.fromUserId,
    required this.toUserId,
    this.isVideo = false,
    this.useCall2 = false,
    this.incomingUI = true,
  });

  @override
  Call1V1PageState createState() => Call1V1PageState();
}

class Call1V1PageState extends State<Call1V1Page> implements CallInfo {
  final CallCubit _callCubit = getIt.get();
  final BehaviorSubject<StringeeSignalingState> _callState =
      BehaviorSubject.seeded(StringeeSignalingState.calling);
  final BehaviorSubject<String> _statusState = BehaviorSubject.seeded('');
  bool showIncomingUI = false;
  bool dismissFuncCalled = false;
  bool isAndroid = Platform.isAndroid;
  bool _isMute = false;
  bool _isSpeakerOn = false;
  bool _isVideoEnable = false;
  bool _hasLocalStream = false;
  bool _hasRemoteStream = false;
  Stopwatch? _stopwatch;
  Timer? _timer;
  String _callDuration = '00:00';
  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _bind();
  }

  @override
  void dispose() {
    _callState.close();
    _statusState.close();
    _stopwatch?.stop();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _stopwatch!.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _callDuration = _formatDuration(_stopwatch!.elapsed);
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void _bind() async {
    if (widget.fromUserId ==
        getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString()) {
      _callCubit.init(
          payload: NewCallPayload(
            receiverId: int.tryParse(widget.toUserId ?? '') ?? 0,
            type: widget.isVideo ? 2 : 1,
          ),
          isVideo: widget.isVideo);
      _callCubit.getParticipant(int.tryParse(widget.toUserId ?? '') ?? 0);
    } else {
      _callCubit.getParticipant(int.tryParse(widget.fromUserId ?? '') ?? 0);
    }
    _isSpeakerOn = widget.isVideo;
    _isVideoEnable = widget.isVideo;
    if (isAndroid) {
      _callCubit.androidCallManager.getCallInfo(this);
      if (widget.incomingUI) {
        showIncomingUI = _callCubit.androidCallManager.showIncomingCall;
      } else {
        makeOutgoingCall();
      }
    } else {
      _callCubit.iOSCallManager.getCallInfo(this);
      if (!widget.incomingUI) {
        // Goi di
        makeOutgoingCall();
      } else {
        // Goi den
        showIncomingUI = true;
      }
    }

    _callState.listen((value) async {
      print('statee ${value.toString()}');
      switch (value) {
        case StringeeSignalingState.busy:
          if (widget.toUserId ==
              getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString()) {
            _statusState.add('Người nhận từ chối cuộc gọi');
            Future.delayed(const Duration(seconds: 2)).then((value) {
              dismiss();
            });
          }

          break;
        case StringeeSignalingState.calling:
          if (widget.toUserId ==
              getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString()) {
            _statusState.add('Đang nối máy đến ${_callCubit.state.participant.getdisplayName}');
          } else {
            _statusState.add(
                '${widget.isVideo ? 'Cuộc gọi video đến từ ' : 'Cuộc gọi thường đến từ '}${_callCubit.state.participant.getdisplayName}');
          }
          break;
        case StringeeSignalingState.ringing:
          _statusState.add('Đang đổ chuông');
          break;
        case StringeeSignalingState.answered:
          _startTimer();
          break;
        case StringeeSignalingState.ended:
          dismiss();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget localView = (_hasLocalStream)
        ? StringeeVideoView(
            isAndroid
                ? _callCubit.androidCallManager.callId
                : _callCubit.iOSCallManager.syncCall!.callId,
            true,
            alignment: Alignment.topRight,
            borderRadius: BorderRadius.circular(12),
            margin: const EdgeInsets.only(top: 128, right: 16),
            height: 195,
            width: 136,
            scalingType: ScalingType.fill,
          )
        : const SizedBox.shrink();

    Widget remoteView = (_hasRemoteStream)
        ? StringeeVideoView(
            isAndroid
                ? _callCubit.androidCallManager.callId
                : _callCubit.iOSCallManager.syncCall!.callId,
            false,
            isMirror: false,
            scalingType: ScalingType.fill,
          )
        : const SizedBox.shrink();

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        endCallTapped();
        return;
      },
      child: Scaffold(
        backgroundColor: AppColors.blueEdit,
        body: BlocBuilder<CallCubit, CallState>(
            bloc: _callCubit,
            builder: (context, state) {
              return Stack(
                children: <Widget>[
                  remoteView,
                  localView,
                  StreamBuilder<StringeeSignalingState>(
                    stream: _callState,
                    builder: (_, data) {
                      if ((widget.isVideo && _callState.value != StringeeSignalingState.answered) ||
                          !widget.isVideo) {
                        return Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Pulsator(
                                  style: const PulseStyle(color: Colors.white),
                                  count: 3,
                                  duration: const Duration(seconds: 4),
                                  repeat: 0,
                                  startFromScratch: false,
                                  autoStart: true,
                                  fit: PulseFit.contain,
                                  child: AvatarWidget(
                                    size: 120,
                                    avatar: state.participant?.avatar ?? '',
                                  ),
                                ),
                              ),
                              Text(
                                state.participant?.getdisplayName ?? '',
                                style: context.textTheme.displayMedium
                                    ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.white),
                              ),
                              kSpacingHeight10,
                              if (_callState.value != StringeeSignalingState.answered)
                                StreamBuilder<String>(
                                  stream: _statusState,
                                  builder: (context, snapshot) {
                                    return Text(
                                      _statusState.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    );
                                  },
                                ),
                              if (!widget.isVideo &&
                                  _callState.value == StringeeSignalingState.answered)
                                Text(
                                  _callDuration,
                                  style: context.textTheme.bodySmall?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff00ff92)),
                                ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 24),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: showIncomingUI
                          ? <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: rejectCallTapped,
                                    child: ImageWidget(
                                      IconAppConstants.icEnd,
                                      height: 72,
                                      width: 72,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: acceptCallTapped,
                                    child: ImageWidget(
                                      widget.isVideo
                                          ? IconAppConstants.icVideoAnswer
                                          : IconAppConstants.icAnswer,
                                      height: 72,
                                      width: 72,
                                    ),
                                  ),
                                ],
                              )
                            ]
                          : <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  if (!widget.isVideo)
                                    ButtonSpeaker(
                                      cubit: _callCubit,
                                      isSpeakerOn: _isSpeakerOn,
                                    ),
                                  if (widget.isVideo)
                                    ButtonVideo(
                                      isVideo: widget.isVideo,
                                      cubit: _callCubit,
                                      isVideoEnable: _isVideoEnable,
                                    ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                    child: GestureDetector(
                                      onTap: endCallTapped,
                                      child: ImageWidget(
                                        IconAppConstants.icEnd,
                                        height: 72,
                                        width: 72,
                                      ),
                                    ),
                                  ),
                                  ButtonMicro(
                                    cubit: _callCubit,
                                    isMute: _isMute,
                                  ),
                                ],
                              ),
                            ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 62),
                      child: GestureDetector(
                        onTap: endCallTapped,
                        child: ImageWidget(
                          IconAppConstants.icBackCall,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 62),
                      child: StreamBuilder<StringeeSignalingState>(
                          stream: _callState,
                          builder: (context, snapshot) {
                            if (_callState.value == StringeeSignalingState.answered) {
                              return Column(
                                children: [
                                  Text(
                                    'VDONE',
                                    style: context.text.bodyMedium?.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  if (widget.isVideo)
                                    Text(
                                      _callDuration,
                                      style: context.textTheme.bodySmall?.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff00ff92)),
                                    ),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                    ),
                  ),
                  widget.isVideo
                      ? ButtonSwitchCamera(
                          cubit: _callCubit,
                        )
                      : const SizedBox.shrink(),
                ],
              );
            }),
      ),
    );
  }

  Future makeOutgoingCall() async {
    final parameters = {
      kFrom: widget.fromUserId,
      kTo: widget.toUserId,
      kisVideoCall: widget.isVideo,
      kVideoQuality: VideoQuality.hd,
    };
    if (isAndroid) {
      if (widget.useCall2) {
        _callCubit.androidCallManager
            .setStringeeCall2(StringeeCall2(CallManager.shared.client), widget.isVideo);
      } else {
        _callCubit.androidCallManager
            .setStringeeCall(StringeeCall(CallManager.shared.client), widget.isVideo);
      }
      _callCubit.androidCallManager.addListenerForCall();
      _callCubit.androidCallManager.makeCall(parameters);
    } else {
      _callCubit.iOSCallManager.syncCall = SyncCall();
      var outgoingCall;
      if (widget.useCall2) {
        outgoingCall = StringeeCall2(CallManager.shared.client);
        _callCubit.iOSCallManager.syncCall!.stringeeCall2 = outgoingCall;
      } else {
        outgoingCall = StringeeCall(CallManager.shared.client);
        _callCubit.iOSCallManager.syncCall!.stringeeCall = outgoingCall;
      }
      _callCubit.iOSCallManager.addListenerForCall();

      outgoingCall.makeCall(parameters).then((result) {
        bool status = result['status'];
        if (widget.useCall2) {
          _callCubit.iOSCallManager.syncCall!.attachCall2(outgoingCall);
        } else {
          _callCubit.iOSCallManager.syncCall!.attachCall(outgoingCall);
        }

        if (!status) {
          _callCubit.iOSCallManager.clearDataEndDismiss();
        }
      });
    }
  }

  void endCallTapped() async {
    if (isAndroid) {
      _callCubit.androidCallManager.hangup();
    } else {
      if (_callCubit.iOSCallManager.syncCall == null) {
        return;
      }
      _callCubit.iOSCallManager.syncCall!.hangup();
    }
    if (widget.fromUserId ==
        getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id.toString()) {
      _callCubit.updateCall();
    }
    Navigator.of(context).pop();
  }

  void acceptCallTapped() {
    if (isAndroid) {
      _callCubit.androidCallManager.answer().then((result) {
        if (result['status']) {
          _callState.add(StringeeSignalingState.answered);
          setState(() {
            showIncomingUI = !showIncomingUI;
          });
        } else {
          rejectCallTapped();
        }
      });
    } else {
      if (_callCubit.iOSCallManager.syncCall == null) {
        return;
      }
      _callCubit.iOSCallManager.answer().then((result) {
        if (result['status']) {
          _callState.add(StringeeSignalingState.answered);
          setState(() {
            showIncomingUI = !showIncomingUI;
          });
        } else {
          rejectCallTapped();
        }
      });
    }
  }

  void rejectCallTapped() {
    if (isAndroid) {
      _callCubit.androidCallManager.reject();
    } else {
      if (_callCubit.iOSCallManager.syncCall == null) {
        return;
      }
      _callCubit.iOSCallManager.syncCall!.userRejected = true;
      _callCubit.iOSCallManager.syncCall!.reject().then((status) {
        _callCubit.iOSCallManager.clearDataEndDismiss();
      });
    }
  }

  void dismiss() {
    _isMute = false;
    _isSpeakerOn = false;
    _isVideoEnable = false;
    _hasLocalStream = false;
    _hasRemoteStream = false;
    _statusState.add('');
    _callState.add(StringeeSignalingState.calling);
    if (isAndroid) {
      Navigator.pop(context);
    } else {
      if (dismissFuncCalled) {
        return;
      }
      dismissFuncCalled = dismissFuncCalled;
      Navigator.pop(context);
    }
  }


  @override
  void onMuteState(bool isMute) {
    setState(() {
      _isMute = isMute;
    });
  }

  @override
  void onReceiveLocalStream() {
    setState(() {
      _hasLocalStream = true;
    });
  }

  @override
  void onReceiveRemoteStream() {
    setState(() {
      _hasRemoteStream = true;
    });
  }

  @override
  void onSpeakerState(bool isSpeakerOn) {
    if (mounted) {
      setState(() {
        _isSpeakerOn = isSpeakerOn;
      });
    }
  }

  @override
  void onStatusChange(StringeeSignalingState? state) {
    if (isAndroid) {
      _callState.add(_callCubit.androidCallManager.callState);
    } else {
      _callState.add(_callCubit.iOSCallManager.syncCall!.callState);
    }
  }

  @override
  void onVideoState(bool isVideoEnable) {
    setState(() {
      _isVideoEnable = isVideoEnable;
    });
  }
}

class ButtonSwitchCamera extends StatefulWidget {
  final CallCubit cubit;
  const ButtonSwitchCamera({super.key, required this.cubit});

  @override
  State<StatefulWidget> createState() => _ButtonSwitchCameraState();
}

class _ButtonSwitchCameraState extends State<ButtonSwitchCamera> {
  void _toggleSwitchCamera() {
    if (isAndroid) {
      widget.cubit.androidCallManager.switchCamera();
    } else {
      if (widget.cubit.iOSCallManager.syncCall == null) {
        return;
      }
      widget.cubit.iOSCallManager.syncCall!.switchCamera();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 62),
        child: GestureDetector(
          onTap: _toggleSwitchCamera,
          child: ImageWidget(
            IconAppConstants.icSwitchCamera,
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}

class ButtonSpeaker extends StatefulWidget {
  final CallCubit cubit;
  final bool isSpeakerOn;
  const ButtonSpeaker({super.key, required this.cubit, required this.isSpeakerOn});

  @override
  State<StatefulWidget> createState() => _ButtonSpeakerState();
}

class _ButtonSpeakerState extends State<ButtonSpeaker> {
  void _toggleSpeaker() {
    if (isAndroid) {
      widget.cubit.androidCallManager.setSpeakerphoneOn();
    } else {
      if (widget.cubit.iOSCallManager.syncCall == null) {
        return;
      }
      widget.cubit.iOSCallManager.setSpeakerphoneOn();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSpeaker,
      child: ImageWidget(
        IconAppConstants.icVolume,
        color: (isAndroid
                ? widget.isSpeakerOn
                : widget.cubit.iOSCallManager.syncCall?.isSpeaker ?? false)
            ? null
            : AppColors.greyLightTextColor,
        height: 72,
        width: 72,
      ),
    );
  }
}

class ButtonMicro extends StatefulWidget {
  final CallCubit cubit;
  final bool isMute;
  const ButtonMicro({
    super.key,
    required this.cubit,
    required this.isMute,
  });

  @override
  State<StatefulWidget> createState() => _ButtonMicroState();
}

class _ButtonMicroState extends State<ButtonMicro> {
  void _toggleMicro() {
    if (isAndroid) {
      widget.cubit.androidCallManager.mute();
    } else {
      if (widget.cubit.iOSCallManager.syncCall == null) {
        return;
      }
      widget.cubit.iOSCallManager.mute();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleMicro,
      child: ImageWidget(
        (isAndroid ? widget.isMute : widget.cubit.iOSCallManager.syncCall?.isMute ?? false)
            ? IconAppConstants.icMicOff
            : IconAppConstants.icMicro,
        height: 72,
        width: 72,
      ),
    );
  }
}

class ButtonVideo extends StatefulWidget {
  final bool isVideo;
  final bool isVideoEnable;
  final CallCubit cubit;

  const ButtonVideo(
      {super.key, required this.isVideo, required this.cubit, required this.isVideoEnable});

  @override
  State<StatefulWidget> createState() => _ButtonVideoState();
}

class _ButtonVideoState extends State<ButtonVideo> {
  void _toggleVideo() {
    if (isAndroid) {
      widget.cubit.androidCallManager.enableVideo();
    } else {
      if (widget.cubit.iOSCallManager.syncCall == null) {
        return;
      }
      widget.cubit.iOSCallManager.enableVideo();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isVideo
        ? GestureDetector(
            onTap: widget.isVideo ? _toggleVideo : null,
            child: ImageWidget(
              (isAndroid
                      ? widget.isVideoEnable
                      : widget.cubit.iOSCallManager.syncCall?.videoEnabled ?? false)
                  ? IconAppConstants.icVideoCall
                  : IconAppConstants.icVideoOff,
              height: 72,
              width: 72,
            ),
          )
        : const SizedBox.shrink();
  }
}
