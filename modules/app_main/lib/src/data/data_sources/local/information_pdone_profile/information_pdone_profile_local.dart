import 'dart:convert';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/update_account/infomation_pdone_profile.dart';
import 'package:app_main/src/domain/entities/update_account/information_none_pdone_profile.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kInfoPdoneProfile = '_kInfoPdoneProfile';
const _kInfoNonePdoneProfile = '_kInfoNonePdoneProfile';

@injectable
class InformationPDoneSharePreferencesUsecase {
  final SharedPreferences _shared;

  const InformationPDoneSharePreferencesUsecase(this._shared);

  Future<bool> saveInfoPDoneProfile(InformationPdoneProfile informationPdoneProfile) =>
      _shared.setString(_kInfoPdoneProfile, jsonEncode(informationPdoneProfile.toJson()));

  Future<bool> saveInfoNonePDoneProfile(InformationNonePdoneProfile informationNonePdoneProfile) =>
      _shared.setString(_kInfoNonePdoneProfile, jsonEncode(informationNonePdoneProfile.toJson()));

  InformationPdoneProfile? getInfoPDoneProfile() {
    final jsonStr = _shared.getString(_kInfoPdoneProfile);

    if (jsonStr?.isNotEmpty ?? false) {
      try {
        final json = jsonDecode(jsonStr!);
        final models = InformationPdoneProfile.fromJson(json);
        return models;
      } catch (e) {
        clearInformationPDoneProfileData();
        LoggerService.print('[InformationPDoneSharePreferencesUsecase]: ${e.toString()}');
        return null;
      }
    }
    return null;
  }

  InformationNonePdoneProfile? getInfoNonePDoneProfile() {
    final jsonStr = _shared.getString(_kInfoNonePdoneProfile);

    try {
      final json = jsonDecode(jsonStr!);
      final models = InformationNonePdoneProfile.fromJson(json);
      return models;
    } catch (e) {
      clearInformationNonePDoneProfileData();
      LoggerService.print('[InformationPDoneSharePreferencesUsecase]: ${e.toString()}');
      return null;
    }
  }

  Future clearInformationPDoneProfileData() async {
    await _shared.setString(_kInfoPdoneProfile, '{}');
  }

  Future clearInformationNonePDoneProfileData() async {
    await _shared.setString(_kInfoNonePdoneProfile, '{}');
  }
}
