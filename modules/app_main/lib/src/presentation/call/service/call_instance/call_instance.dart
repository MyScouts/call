import 'package:flutter/widgets.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../../1vs1/bloc/call_1vs1_bloc.dart';
import '../../../call/call_coordinator.dart';
import '../../models/call_1vs1_state_data.dart';

abstract class CallInstance {
  CallInstance(this.bloc);

  bool callScreenShowed = false;

  // Incase receive the call PN, we save temp CallIntance without service
  final Call1vs1Bloc? bloc;

  get call => bloc?.call;

  // StringeeCall get call1 => bloc?.call;

  StringeeClient? get client => bloc?.client;

  Call1vs1StateData? get callStateData => bloc?.state.data;

  CallState? get callState => callStateData?.callState;

  CallScreenState? get screenState => callStateData?.screenState;

  String? get callId => call?.id;

  int? get serial => call?.serial;

  StringeeMediaState? get mediaState => callState?.mediaState;

  StringeeSignalingState? get signalingState => callState?.signaling;

  bool hasStringeeCall() {
    return call != null;
  }

  bool get shouldShowIncomingWhenAppResumed =>
      bloc != null &&
      [
        !bloc!.state.isCallClosed,
        !bloc!.state.isLeaving,
      ].every((e) => e) &&
      !ended();

  bool ended();

  void dispose() {
    if (bloc != null && !bloc!.isClosed) {
      if (!bloc!.state.isCallClosed || !bloc!.state.isLeaving) {
        bloc!.add(CloseCallEvent());
      }
      bloc!.close();
    }
  }

  Future showIncomingCall(BuildContext context) {
    if (callScreenShowed) {
      return Future.value();
    }
    callScreenShowed = true;
    return context.showIncomingCall(bloc: bloc!);
  }
}
