part of 'deeplink_bloc.dart';

@immutable
abstract class DeeplinkEvent {}

class OpenLinkEvent extends DeeplinkEvent {
  final String url;

  OpenLinkEvent(this.url);
}
