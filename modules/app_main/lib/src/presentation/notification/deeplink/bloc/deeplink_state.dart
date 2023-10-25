part of 'deeplink_bloc.dart';

@immutable
abstract class DeeplinkState {}

class DeeplinkInitial extends DeeplinkState {}

class DeeplinkOpend extends DeeplinkInitial {
  final String link;

  DeeplinkOpend(this.link);
}
