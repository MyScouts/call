import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _assessToken = '_assessToken';
const _refreshToken = '_refreshToken';
const _kFCMToken = '_kFCMToken';
const _keySubTopic = '_keySubTopicFcm';

@injectable
class UserSharePreferencesUsecase extends UserInfoSharePreferencesUsecase {
  final SharedPreferences _shared;

  const UserSharePreferencesUsecase(this._shared) : super(_shared);

  Future<void> saveToken(String assessToken, String refreshToken) async {
    _shared.setString(_assessToken, assessToken);
    _shared.setString(_refreshToken, refreshToken);
  }

  String? getToken() => _shared.getString(_assessToken);

  bool get isAuthenticated => getToken()?.isNotEmpty ?? false;

  Future<bool> saveFCMToken(String token) =>
      _shared.setString(_kFCMToken, token);

  bool get getSubTopicFCM => _shared.getBool(_keySubTopic) ?? false;

  Future<bool> saveSubTopicFCM() => _shared.setBool(_keySubTopic, true);
}
