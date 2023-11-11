import 'package:app_main/src/domain/entities/update_account/pdone_profile.dart';
import 'package:app_main/src/domain/entities/update_account/place/place_information.dart';
import 'package:app_main/src/domain/entities/update_account/update_pdone_birth_place_payload.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/domain/entities/update_account/update_profile_payload.dart';
import 'package:flutter/material.dart';
import 'package:app_core/app_core.dart';

mixin UpdateInformationProfileMixin<T extends StatefulWidget> on State<T> {
  final forcusCCCD = ValueNotifier(false);
  final forcusCCCDDay = ValueNotifier(false);
  final forcusCCCDPlace = ValueNotifier(false);

  /// ------------------------------------------
  final fullNameTxtController = TextEditingController();
  final nickNameTxtController = TextEditingController();
  final emailAddressTxtController = TextEditingController();
  final addressTxtController = TextEditingController();
  final idNumberTxtController = TextEditingController();
  final placeOfNumberTxtController = TextEditingController();

  final idPDoneProtectorTxtController = TextEditingController();
  final idNumberProtectorTxtController = TextEditingController();

  final bankNumberTxtController = TextEditingController();
  final bankAccountHolderTxtController = TextEditingController();

  final careerTxtController = TextEditingController();
  final giftedTxtController = TextEditingController();
  final hobbyTxtController = TextEditingController();
  
  final bloodGroupCtrl = TextEditingController();
  final maritalStatusCtrl = TextEditingController();
  final talentCtrl = TextEditingController();
  final interestCtrl = TextEditingController();
  final jobCtrl = TextEditingController();
  final academyCtrl = TextEditingController();

  /// birth place
  final bpProvinceCtrl = TextEditingController();
  final bpDistrictCtrl = TextEditingController();
  final bpWardCtrl = TextEditingController();
  final bpStreetCtrl = TextEditingController();
  final bpAddressCtrl = TextEditingController();

  /// Protector
  final identifyNumberProtectorCtrl = TextEditingController();
  final pDoneIdProtectorCtrl = TextEditingController();
  final emailOrPhoneProtectorCtrl = TextEditingController();

  /// ------------------------------------------
  UpdateProfilePayload payload = const UpdateProfilePayload();

  // Gender? currentGender;
  DateTime? birthDay;
  DateTime? supplyDate;
  DateTime? expiryDate;
  // Protector? currentProtector;
  // BloodGroup? bloodGroup;
  // MaritalStatus? maritalStatus;
  // AcademicLevel? academicLevel;
  // Job? job;
  // Talent? talent;
  // Interest? interest;
  PlaceInformation? birthPlace;
  PlaceInformation? currentPlace;

  void updateInformation(PDoneProfile? pDoneProfile) {
    if (pDoneProfile == null) {
      return;
    }

    fullNameTxtController.text = pDoneProfile.firstName ?? '';
    emailAddressTxtController.text = pDoneProfile.middleName ?? '';
    addressTxtController.text = pDoneProfile.lastName ?? '';
    nickNameTxtController.text = pDoneProfile.nickname ?? '';

    bankNumberTxtController.text = pDoneProfile.identityNumber ?? '';
    bankAccountHolderTxtController.text = pDoneProfile.supplyAddress ?? '';

    careerTxtController.text = (pDoneProfile.weight ?? '').toString();
    giftedTxtController.text = (pDoneProfile.height ?? '').toString();

    // currentGender = pDoneProfile.sex;
    birthDay = pDoneProfile.birthday;
    supplyDate = pDoneProfile.supplyDate;

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
      birthPlace: const UpdatePDoneBirthPlacePayload(),
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

  UpdatePlaceInformationPayload copyWithPlaceInformation(PlaceInformation? placeInformation) {
    return UpdatePlaceInformationPayload(
      countryName: placeInformation!.country!.name,
      provinceName: placeInformation.province!.name,
      districtName: placeInformation.district!.name,
      wardName: placeInformation.ward!.name,
      street: '',
      address: placeInformation.address,
      countryCode: placeInformation.country!.iso2,
      provinceCode: placeInformation.province!.stateCode.toString(),
      districtCode: placeInformation.district!.code.toString(),
      wardCode: placeInformation.ward!.id.toString(),
    );
  }

  bool checkIsUnder15ShouldEnableField() {
    return birthDay == null || birthDay != null && !birthDay!.isUnder15yearsAgo();
  }

  @override
  void dispose() {
    fullNameTxtController.dispose();
    nickNameTxtController.dispose();
    emailAddressTxtController.dispose();
    addressTxtController.dispose();
    idNumberTxtController.dispose();
    placeOfNumberTxtController.dispose();
    idPDoneProtectorTxtController.dispose();
    idNumberProtectorTxtController.dispose();
    bankNumberTxtController.dispose();
    bankAccountHolderTxtController.dispose();
    careerTxtController.dispose();
    giftedTxtController.dispose();
    super.dispose();
  }
}
