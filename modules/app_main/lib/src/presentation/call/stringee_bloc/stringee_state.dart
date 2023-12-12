part of 'stringee_bloc.dart';

abstract class StringeeState {
  final StringeeClient client;

  const StringeeState(this.client);
}

class StringeeInitial extends StringeeState {
  StringeeInitial(
    StringeeClient client,
  ) : super(client);
}

class StringeeClientConnected extends StringeeState {
  StringeeClientConnected(StringeeClient client) : super(client);
}

class IncomingCall extends StringeeState {
  final StringeeCall call;

  IncomingCall(
    StringeeClient client,
    this.call,
  ) : super(client);
}

class IncomingCall2 extends StringeeState {
  final StringeeCall2 call;

  IncomingCall2(
      StringeeClient client,
      this.call,
      ) : super(client);
}