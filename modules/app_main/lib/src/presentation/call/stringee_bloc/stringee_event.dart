part of 'stringee_bloc.dart';

abstract class StringeeEvent {}

class ConnectionEvent extends StringeeEvent {}

class NotifyIncomingCallEvent extends StringeeEvent {
  final StringeeCall call;

  NotifyIncomingCallEvent(this.call);
}

class NotifyIncomingCallEvent2 extends StringeeEvent {
  final StringeeCall2 call;

  NotifyIncomingCallEvent2(this.call);
}
