part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingEvent {}

class SaveLanguageEvent extends AppSettingEvent {
  final String language;

  SaveLanguageEvent(this.language);
}

class BottomBarItemSelected extends AppSettingEvent {
  final int index;
  final void Function()? handler;

  BottomBarItemSelected(this.index, {this.handler});
}

class UserLogoutEvent extends AppSettingEvent {
  final bool force;

  UserLogoutEvent({this.force = false});
}

class OpenDashboardDrawerMenuEvent extends AppSettingEvent {}
