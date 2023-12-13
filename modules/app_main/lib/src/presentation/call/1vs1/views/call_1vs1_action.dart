part of 'call_1vs1_screen.dart';

extension Call1vs1ScreenAction on Call1vs1ScreenState {
  StorageService get storageService => injector.get<StorageService>();

  void _blocListener(BuildContext context, Call1vs1State state) {
    callType = state.callType;
    if (state.screenState == CallScreenState.closed) {
      if (MyNavigatorObserver.listRoute.contains(Call1vs1Screen.routeName)) {
        Navigator.pop(context);
      }
    } else if (state is CallingErrorState) {
      if (MyNavigatorObserver.listRoute.contains(Call1vs1Screen.routeName)) {
        Navigator.pop(context);
        showToastMessage(state.message);
      }
    } else {
      _handleRingtone(state);
    }
  }

  void _handleRingtoneCompleted() {
    if (bloc.state.isIncomingCall || bloc.state.isMakingACall) {
      ringtonePlaying = false;
      // Ringtone is completed -> must be restart as loop.
      _handleRingtone(bloc.state);
    }
  }

  void _handleRingtone(Call1vs1State state) {
    if (state.isMakingACall) {
      if (!ringtonePlaying) {
        playAudioSource(AudioConstants.outgoingCallRingtone);
      }
      return;
    }
    if (state.isIncomingCall) {
      if (!ringtonePlaying) {
        playAudioSource(AudioConstants.incomingCallRingtone);
      }
      return;
    }
    // other cases none/inCall/leaving/closed should stop ringtone also.
    if (ringtonePlaying) {
      _audioController.stopPlayer();
      return;
    }
  }

  Future<void> playAudioSource(String source) async {
    ringtonePlaying = true;
    await _audioController.stopPlayer();
    await _getRingtoneFilePath(source).then((filePath) {
      if (!bloc.state.isInCall) {
        _audioController.play(filePath);
      } else {
        _audioController.stopPlayer();
        ringtonePlaying = false;
      }
    });
  }

  Future<String> _getRingtoneFilePath(String source) async {
    if (ringtonePathCached[source] != null) {
      return ringtonePathCached[source]!;
    }
    return storageService.getFilePath(source).then((value) {
      ringtonePathCached[source] = value;
      return value;
    });
  }

  void onPressVideoCall() {
    bloc.add(EnableCameraEvent());
  }

  void onPressSpeaker() {
    bloc.add(ToggleSpeakerEvent());
  }

  void onPressMic() {
    bloc.add(ToggleMicEvent());
  }

  void onAnswer() {
    bloc.add(AnswerCallEvent());
  }

  void onEndCall() {
    bloc.add(CloseCallEvent());
  }

  // void onBack() {
  //   if(widget.callType == CallType.video && bloc.state.isInCall) {
  //     Navigator.pop(context);
  //     Future.delayed(
  //       const Duration(milliseconds: 300),
  //           () {
  //         if (!bloc.state.isInCall || callType == CallType.audio) {
  //           _audioController.dispose();
  //           return;
  //         } else {
  //           try {
  //             PipHandler.addCallOverlay(
  //               PipView(
  //                 width: SizeConfig.screenWidth * 0.4,
  //                 height: SizeConfig.screenHeight * 0.45,
  //                 borderRadius: BorderRadius.circular(8),
  //                 backgroundColor: Colors.black.withOpacity(0.8),
  //                 child: BlocProvider<Call1vs1Bloc>.value(
  //                   value: bloc,
  //                   child: const PipCallRender(),
  //                 ),
  //               ),
  //               bloc,
  //             );
  //
  //           } catch (e,s) {
  //             print(e);
  //             print(s);
  //           }
  //         }
  //       },
  //     );
  //   } else {
  //     bloc.add(CloseCallEvent());
  //   }
  // }

  void onSwitchCamera() {
    bloc.add(SwitchCameraEvent());
  }
}
