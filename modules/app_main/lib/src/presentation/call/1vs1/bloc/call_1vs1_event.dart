part of 'call_1vs1_bloc.dart';

@immutable
abstract class Call1vs1Event {}

class MakeCall1vs1Event extends Call1vs1Event {
  final User participant;

  MakeCall1vs1Event({
    required this.participant,
  });
}

class ConnectToCallEvent extends Call1vs1Event {}

class NotifyCallingErrorEvent extends Call1vs1Event {
  final Object error;
  final StackTrace stackTrace;

  NotifyCallingErrorEvent(this.error, this.stackTrace);
}

class HandleCallStateChangedEvent extends Call1vs1Event {
  final CallEvent callEvent;

  HandleCallStateChangedEvent(this.callEvent);
}

// action on call
class AnswerCallEvent extends Call1vs1Event {}

class ToggleSpeakerEvent extends Call1vs1Event {
  final bool? isSpeaker;

  ToggleSpeakerEvent([this.isSpeaker]);
}

class SwitchCameraEvent extends Call1vs1Event {}

class AcceptCameraEvent extends Call1vs1Event {}

class ToggleMicEvent extends Call1vs1Event {
  final bool? muted;

  ToggleMicEvent([this.muted]);
}

class EnableCameraEvent extends Call1vs1Event {
  final bool? enable;

  EnableCameraEvent({this.enable});
}

class CloseCallEvent extends Call1vs1Event {}
