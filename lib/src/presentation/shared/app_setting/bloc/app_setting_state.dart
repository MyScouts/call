part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {
  final int index;
  final String languageCode;
  final String countryCode;

  const AppSettingState(this.languageCode, this.countryCode, this.index);
}

class AppStateInitial extends AppSettingState {
  const AppStateInitial(super.languageCode, super.countryCode, super.index);
}

class SaveLanguageSuccess extends AppStateInitial {
  const SaveLanguageSuccess(super.languageCode, super.countryCode, super.index);
}

class ButtombarSelected extends AppStateInitial {
  final void Function()? handler;

  const ButtombarSelected(
      super.languageCode, super.countryCode, super.index, this.handler);
}

class AppForceLogoutSuccess extends AppSettingState {
  final int time;
  const AppForceLogoutSuccess(
    super.languageCode,
    super.countryCode,
    super.index,
    this.time,
  );
}

class OpenDashboardDrawerMenuState extends AppStateInitial {
  const OpenDashboardDrawerMenuState(
      super.languageCode, super.countryCode, super.index);
}
