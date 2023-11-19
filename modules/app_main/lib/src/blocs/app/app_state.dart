part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class UpgradeAppVersion extends AppState {
  final VersionResponse? version;
  UpgradeAppVersion({this.version});
}

final class AutoLogin extends AppState {}

final class UnauthorizedApp extends AppState {}

final class AppInitialFailed extends AppState {}
