import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _assessToken = '_assessToken';
const _refreshToken = '_refreshToken';
const _kFCMToken = '_kFCMToken';
const _kStringeeToken = '_kStringeeToken';
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

  Future<bool> saveStringeeToken(String token) =>
      _shared.setString(_kStringeeToken, token);

  String? get getFcmToken => _shared.getString(_kFCMToken);

  bool get getSubTopicFCM => _shared.getBool(_keySubTopic) ?? false;

  Future<bool> saveSubTopicFCM() => _shared.setBool(_keySubTopic, true);

  bool isMe(int? id) => getUserInfo()?.id == id;

  /// stringee token
  String? get getStringeeToken => _shared.getString(_kStringeeToken);

}
