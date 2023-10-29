import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/logger_service.dart';
import '../entities/user/user.dart';

const _kUserInfo = '_kUserInfo';
const _assessToken = '_assessToken';
const _refreshToken = '_refreshToken';

@injectable
class UserInfoSharePreferencesUsecase {
  final SharedPreferences _shared;

  const UserInfoSharePreferencesUsecase(this._shared);

  // User Information
  Future<bool> saveUserInfo(User userInfo) =>
      _shared.setString(_kUserInfo, jsonEncode(userInfo.toJson()));

  User? getUserInfo() {
    final jsonStr = _shared.getString(_kUserInfo);

    if (jsonStr?.isNotEmpty ?? false) {
      try {
        final json = jsonDecode(jsonStr!);
        final loginModel = User.fromJson(json);
        return loginModel;
      } catch (e) {
        //reset wrong _kUserInfo
        _shared.setString(_assessToken, '');
        _shared.setString(_refreshToken, '');
        _shared.setString(_kUserInfo, '{}');
        LoggerService.print(
            '[UserInfoSharePreferencesUsecase]: ${e.toString()}');
        return null;
      }
    }
    return null;
  }
}
