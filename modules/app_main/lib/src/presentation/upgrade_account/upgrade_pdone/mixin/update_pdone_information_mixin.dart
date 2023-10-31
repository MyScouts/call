import 'package:flutter/material.dart';
import '../../../../core/extensions/datetime_ext.dart';
import 'package:app_core/app_core.dart';
import '../../../../domain/entities/update_account/pdone_profile.dart';
import '../../../../domain/entities/update_account/place/place_information.dart';
import '../../../../domain/entities/update_account/update_place_information_payload.dart';
import '../../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../../domain/entities/update_account/upgrade_account.dart';

mixin UpdatePDoneInformationMixin<T extends StatefulWidget> on State<T> {
  final forcusCCCD = ValueNotifier(false);
  final forcusCCCDDay = ValueNotifier(false);
  final forcusCCCDPlace = ValueNotifier(false);

  /// ------------------------------------------
  final firstNameCtrl = TextEditingController();
  final middleNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final nickNameCtrl = TextEditingController();

  final identifyNumberCtrl = TextEditingController();
  final supplyAddressCtrl = TextEditingController();

  final birthPlaceAddressCtrl = TextEditingController();
  final currentPlaceAddressCtrl = TextEditingController();

  final weightCtrl = TextEditingController();
  final heightCtrl = TextEditingController();

  /// Protector
  final identifyNumberProtectorCtrl = TextEditingController();
  final pDoneIdProtectorCtrl = TextEditingController();
  final emailOrPhoneProtectorCtrl = TextEditingController();

  /// ------------------------------------------
  UpdateProfilePayload payload = const UpdateProfilePayload();

  Gender? currentGender;
  DateTime? birthDay;
  DateTime? supplyDate;
  Protector? currentProtector;
  BloodGroup? bloodGroup;
  MaritalStatus? maritalStatus;
  AcademicLevel? academicLevel;
  Job? job;
  Talent? talent;
  Interest? interest;
  PlaceInformation? birthPlace;
  PlaceInformation? currentPlace;

  void updateInformation(PDoneProfile? pDoneProfile) {
    if (pDoneProfile == null) {
      return;
    }

    firstNameCtrl.text = pDoneProfile.firstName ?? '';
    middleNameCtrl.text = pDoneProfile.middleName ?? '';
    lastNameCtrl.text = pDoneProfile.lastName ?? '';
    nickNameCtrl.text = pDoneProfile.nickname ?? '';

    identifyNumberCtrl.text = pDoneProfile.identityNumber ?? '';
    supplyAddressCtrl.text = pDoneProfile.supplyAddress ?? '';

    birthPlaceAddressCtrl.text = pDoneProfile.birthPlace?.address ?? '';
    currentPlaceAddressCtrl.text = pDoneProfile.currentPlace?.address ?? '';

    weightCtrl.text = (pDoneProfile.weight ?? '').toString();
    heightCtrl.text = (pDoneProfile.height ?? '').toString();

    currentGender = pDoneProfile.sex;
    birthDay = pDoneProfile.birthday;
    supplyDate = pDoneProfile.supplyDate;
    currentProtector = pDoneProfile.protector;
    bloodGroup = pDoneProfile.bloodGroup;
    maritalStatus = pDoneProfile.maritalStatus;
    academicLevel = pDoneProfile.academicLevel;
    job = pDoneProfile.job;
    interest = pDoneProfile.interest;
    talent = pDoneProfile.talent;

    birthPlace = pDoneProfile.birthPlace;
    currentPlace = pDoneProfile.currentPlace;

    payload = copyWithPDoneProfile(pDoneProfile);
  }

  UpdateProfilePayload copyWithPDoneProfile(PDoneProfile profile) {
    return UpdateProfilePayload(
      firstName: profile.firstName,
      lastName: profile.lastName,
      nickname: profile.nickname,
      middleName: profile.middleName,
      sex: profile.sex?.key,
      birthday: profile.birthday?.text(),
      birthPlace: copyWithPlaceInformation(profile.birthPlace),
      currentPlace: copyWithPlaceInformation(profile.currentPlace),
      identityNumber: profile.identityNumber,
      supplyDate: profile.supplyDate?.text(),
      supplyAddress: profile.supplyAddress,
      height: profile.height,
      weight: profile.weight,
      maritalStatus: profile.maritalStatus?.key,
      bloodGroup: profile.bloodGroup?.id,
      academicLevel: profile.academicLevel?.key,
      job: profile.job?.key,
      interest: profile.interest?.key,
      talent: profile.talent?.key,
      protector: profile.protector?.id,
      protectorPDoneId: profile.protectorPDoneId,
    );
  }

  UpdatePlaceInformationPayload copyWithPlaceInformation(
      PlaceInformation? placeInformation) {
    return UpdatePlaceInformationPayload(
      country: placeInformation?.country?.iso2,
      province: placeInformation?.province?.stateCode,
      district: placeInformation?.district?.code,
      ward: placeInformation?.ward?.id,
      address: placeInformation?.address,
    );
  }

  bool checkIsUnder15ShouldEnableField() {
    return birthDay == null ||
        birthDay != null && !birthDay!.isUnder15yearsAgo();
  }

  @override
  void dispose() {
    firstNameCtrl.dispose();
    middleNameCtrl.dispose();
    lastNameCtrl.dispose();
    nickNameCtrl.dispose();
    birthPlaceAddressCtrl.dispose();
    currentPlaceAddressCtrl.dispose();
    weightCtrl.dispose();
    heightCtrl.dispose();
    identifyNumberCtrl.dispose();
    supplyAddressCtrl.dispose();
    super.dispose();
  }
}