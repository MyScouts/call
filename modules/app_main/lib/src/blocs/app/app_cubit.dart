import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:app_main/src/domain/usecases/authentication_usecase.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:version/version.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final ResourceUsecase _srcUsecase;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;
  final AuthenticationUsecase _authUsecase;
  AppCubit(
    this._srcUsecase,
    this._userSharePreferencesUsecase,
    this._authUsecase,
  ) : super(AppInitial());

  Future appInitial({
    required String type,
    required bool isProduction,
  }) async {
    try {
      emit(AppInitial());
      final appInfo = await DeviceService.getPackageInfo();
      final currentVersion = Version.parse(appInfo.version);
      final response = await _srcUsecase.getLatestVersion(type: type);
      // check app version
      if (response != null && response.force && isProduction) {
        final newVersion = Version.parse(response.version);
        if (newVersion > currentVersion) {
          emit(UpgradeAppVersion(version: response));
          return;
        }
      }
    } catch (e) {
      debugPrint("appInitial: $e");
      try {
        if (_userSharePreferencesUsecase.isAuthenticated) {
          await _authUsecase.syncUser();
          emit(AutoLogin());
        } else {
          emit(UnauthorizedApp());
        }
      } catch (e) {
        emit(AppInitialFailed());
      }
    }
  }
}
