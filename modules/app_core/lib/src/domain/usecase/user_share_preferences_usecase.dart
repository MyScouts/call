import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_core.dart';

const _kUserInfo = '_kUserInfo';
const _assessToken = '_assessToken';
const _refreshToken = '_refreshToken';
const _onboarding = '_onboarding';
const _keySubTopic = '_keySubTopicFcm';

@injectable
class UserInfoSharePreferencesUsecase {
  final SharedPreferences _shared;

  const UserInfoSharePreferencesUsecase(this._shared);

  // User Information
  Future<bool> saveUserInfo(User userInfo) =>
      _shared.setString(_kUserInfo, jsonEncode(userInfo.toJson()));

// User Information
  Future<bool> saveOnboarding(OnBoarding onboarding) =>
      _shared.setString(_onboarding, jsonEncode(onboarding.toJson()));

  User? getUserInfo() {
    final jsonStr = _shared.getString(_kUserInfo);

    if (jsonStr?.isNotEmpty ?? false) {
      try {
        final json = jsonDecode(jsonStr!);
        final loginModel = User.fromJson(json);
        return loginModel;
      } catch (e) {
        //reset wrong _kUserInfo
        clearUserData();
        LoggerService.print(
            '[UserInfoSharePreferencesUsecase]: ${e.toString()}');
        return null;
      }
    }
    return null;
  }

  OnBoarding? getOnboarding() {
    final jsonStr = _shared.getString(_onboarding);
    if (jsonStr?.isNotEmpty ?? false) {
      try {
        final json = jsonDecode(jsonStr!);
        return OnBoarding.fromJson(json);
      } catch (e) {
        //reset wrong _kUserInfo
        clearUserData();
        LoggerService.print(
            '[UserInfoSharePreferencesUsecase]: ${e.toString()}');
        return null;
      }
    }
    return null;
  }

  Future clearUserData() async {
    await _shared.setString(_assessToken, '');
    await _shared.setString(_refreshToken, '');
    await _shared.setString(_kUserInfo, '{}');
    await _shared.setString(_keySubTopic, '');
  }
}
