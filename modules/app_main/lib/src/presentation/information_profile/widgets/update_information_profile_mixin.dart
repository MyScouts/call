import 'package:app_main/src/domain/entities/update_account/place/place_information.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
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

  /// birth place
  final bpCountryCtrl = TextEditingController();
  final bpProvinceCtrl = TextEditingController();
  final bpDistrictCtrl = TextEditingController();
  final bpWardCtrl = TextEditingController();
  final bpStreetCtrl = TextEditingController();
  final bpAddressCtrl = TextEditingController();

  /// Protector
  final identifyNumberProtectorCtrl = TextEditingController();
  final pDoneIdProtectorCtrl = TextEditingController();
  final emailOrPhoneProtectorCtrl = TextEditingController();

  Gender? currentGender;
  DateTime? birthDay;
  DateTime? supplyDate;
  DateTime? expiryDate;
  Protector? currentProtector;
  BloodGroup? bloodGroup;
  MaritalStatus? maritalStatus;
  AcademicLevel? academicLevel;
  Job? job;
  Talent? talent;
  Interest? interest;
  PlaceInformation? birthPlace;
  PlaceInformation? currentPlace;

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

    bpCountryCtrl.dispose();
    bpProvinceCtrl.dispose();
    bpDistrictCtrl.dispose();
    bpWardCtrl.dispose();
    bpStreetCtrl.dispose();
    bpAddressCtrl.dispose();
    super.dispose();
  }
}
