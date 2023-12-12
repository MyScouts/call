part of 'call_1vs1_bloc.dart';

abstract class Call1vs1State {
  final Call1vs1StateData data;

  Call1vs1State(this.data);

  T copyWith<T extends Call1vs1State>({
    Call1vs1StateData? data,
    // This param only apply for CallingErrorState
    String? errorMessage,
  }) {
    return _factories[T == Call1vs1State ? runtimeType : T]!(
      data ?? this.data,
      errorMessage,
    );
  }

  User? get me => data.me;
  User? get participant => data.participant;
  CallType get callType => data.callType;
  CallScreenState get screenState => data.screenState;
  CallState get callState => data.callState;
  String? get callId => data.callState.callId;

  bool get isCallClosed => screenState == CallScreenState.closed;
  bool get isInCall => screenState == CallScreenState.inCall;
  bool get isLeaving => screenState == CallScreenState.leaving;
  bool get isMakingACall => screenState == CallScreenState.makingACall;
  bool get isIncomingCall => screenState == CallScreenState.incomingCall;
}

class Call1vs1StateInitial extends Call1vs1State {
  Call1vs1StateInitial({
    Call1vs1StateData data = const Call1vs1StateData(),
  }) : super(data);
}

class CallingErrorState extends Call1vs1State {
  final String message;
  CallingErrorState({
    required this.message,
    Call1vs1StateData data = const Call1vs1StateData(),
  }) : super(data);
}

final _factories = <Type,
    Function(
  Call1vs1StateData data,
  String? errorMessage,
)>{
  Call1vs1StateInitial: (data, _) => Call1vs1StateInitial(
        data: data,
      ),
  CallingErrorState: (data, errorMessage) => CallingErrorState(
        data: data,
        message: errorMessage ?? '',
      ),
};
