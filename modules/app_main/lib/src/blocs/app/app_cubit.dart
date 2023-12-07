import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/resource_response.dart';
import 'package:app_main/src/domain/usecases/authentication_usecase.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    emit(AppInitial());
    await getAppVersion(type: type, isProduction: isProduction);

    try {
      if (_userSharePreferencesUsecase.isAuthenticated) {
        await _authUsecase.syncUser();
        emit(AutoLogin());
      } else {
        emit(UnauthorizedApp());
      }
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        logout();
      } else {
        rethrow;
      }
    } catch (e) {
      emit(AppInitialFailed());
    }
  }

  Future<void> getAppVersion({
    required String type,
    required bool isProduction,
  }) async {
    emit(LoadingAppVersion());
    try {
      final packageInfo = await DeviceService.getPackageInfo();
      final currentVersion = Version.parse(packageInfo.version);
      final response = await _srcUsecase.getLatestVersion(type: type);
      // check app version
      if (response != null && isProduction) {
        final newVersion = Version.parse(response.version);
        if (newVersion > currentVersion) {
          if (response.force) {
            emit(UpgradeAppVersion(
                version: response, currentPackageInfo: packageInfo));
          } else {
            emit(OptionalUpgradeAppVersion(
                version: response.version, currentPackageInfo: packageInfo));
          }
        } else {
          emit(LatestAppVersion(currentPackageInfo: packageInfo));
        }
      } else {
        emit(LatestAppVersion(currentPackageInfo: packageInfo));
      }
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        logout();
      } else {
        rethrow;
      }
    } catch (e) {
      debugPrint("getAppVersion: $e");
      emit(GetAppVersionFailed(error: e.toString(), versions: (null, null)));
    }
  }

  Future logout() async {
    try {
      emit(OnLogout());
      await _authUsecase.logout();
      emit(LogoutSuccess());
      emit(ForceLogoutSuccess());
    } catch (e) {
      if (kDebugMode) {
        throw Exception(e);
      }
    }
  }
}
