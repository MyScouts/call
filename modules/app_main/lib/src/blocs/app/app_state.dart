part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class LoadingAppVersion extends AppState {}

final class UpgradeAppVersion extends AppState {
  UpgradeAppVersion({this.version, required this.currentPackageInfo});

  final VersionResponse? version;
  final PackageInfo currentPackageInfo;
}

final class OptionalUpgradeAppVersion extends AppState {
  OptionalUpgradeAppVersion(
      {required this.version, required this.currentPackageInfo});

  final String version;
  final PackageInfo currentPackageInfo;
}

final class LatestAppVersion extends AppState {
  LatestAppVersion({required this.currentPackageInfo});

  final PackageInfo currentPackageInfo;
}

final class GetAppVersionFailed extends AppState {
  GetAppVersionFailed({required this.error, required this.versions});

  final (Version?, Version?) versions;

  final String error;
}

final class AutoLogin extends AppState {}

final class UnauthorizedApp extends AppState {}

final class AppInitialFailed extends AppState {}

final class ForceLogoutSuccess extends AppState {}

final class OnLogout extends AppState {}

final class LogoutSuccess extends AppState {}

final class LogoutFail extends AppState {}
