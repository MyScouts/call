import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/domain/entities/bank.dart';
import 'package:app_main/src/domain/entities/update_account/place/country.dart';
import 'package:app_main/src/domain/entities/update_account/place/district.dart';
import 'package:app_main/src/domain/entities/update_account/place/place_information.dart';
import 'package:app_main/src/domain/entities/update_account/place/province.dart';
import 'package:app_main/src/domain/entities/update_account/place/ward.dart';
import 'package:app_main/src/domain/entities/update_account/update_pdone_birth_place_payload_2.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/domain/entities/update_account/upgrade_account.dart';
import 'package:flutter/material.dart';

mixin UpdateInformationProfileMixin<T extends StatefulWidget> on State<T> {
  final forcusCCCD = ValueNotifier(false);
  final forcusCCCDDay = ValueNotifier(false);
  final forcusCCCDPlace = ValueNotifier(false);

  /// ------------------------------------------
  final firstNameTxtController = TextEditingController();
  final middleNameTxtController = TextEditingController();
  final fullNameTxtController = TextEditingController();
  final lastNameTxtController = TextEditingController();
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

  Country? currentCountry;
  Province? currentProvince;
  District? currentDistrict;
  Ward? currentWard;

  Country? currentCountry2;
  Province? currentProvince2;
  District? currentDistrict2;
  Ward? currentWard2;

  ValueNotifier<List<Country>?> countriesChanged = ValueNotifier([]);
  ValueNotifier<List<Province>?> provincesChanged = ValueNotifier([]);
  ValueNotifier<List<District>?> districtsChanged = ValueNotifier([]);
  ValueNotifier<List<Ward>?> wardsChanged = ValueNotifier([]);

  ValueNotifier<List<Country>?> countries2Changed = ValueNotifier([]);
  ValueNotifier<List<Province>?> provinces2Changed = ValueNotifier([]);
  ValueNotifier<List<District>?> districts2Changed = ValueNotifier([]);
  ValueNotifier<List<Ward>?> wards2Changed = ValueNotifier([]);

  ValueNotifier<bool> isUpdateChanged = ValueNotifier(false);

  Gender? currentGender;
  ValueNotifier<DateTime?> birthDayChanged = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime?> supplyDateChanged = ValueNotifier(DateTime.now());
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

  String firstName = "";
  String middleName = "";
  String lastName = "";
  String fullName = "";
  String nickName = "";
  String emailAddress = "";
  String address = "";
  String idNumber = "";
  String placeOfNumber = "";
  DateTime supplyDate = DateTime.now();
  DateTime birthDay = DateTime.now();

  String phoneCode = "+84";
  int genderParam = 1;
  int protectorID = 1;
  String bankParam = "";

  String eduParam = "";
  String jobParam = "";
  String bloodTypeParam = "";
  String hobbyParam = "";
  String talentParam = "";
  String martialStatusParam = "";

  ValueNotifier<List<Protector>> protectorsChanged = ValueNotifier([]);
  ValueNotifier<List<Gender>> gendersChanged = ValueNotifier([]);
  ValueNotifier<List<MaritalStatus>> maritalsChanged = ValueNotifier([]);
  ValueNotifier<List<Job>> jobsChanged = ValueNotifier([]);
  ValueNotifier<List<BloodGroup>> bloodTypesChanged = ValueNotifier([]);
  ValueNotifier<List<AcademicLevel>> educationsChanged = ValueNotifier([]);
  ValueNotifier<List<Interest>> hobbiesChanged = ValueNotifier([]);
  ValueNotifier<List<Talent>> talentsChanged = ValueNotifier([]);
  ValueNotifier<List<Bank>> banksChanged = ValueNotifier([]);

  UpdateNonePDoneProfilePayload passNonePDonePayload() {
    return UpdateNonePDoneProfilePayload(
      nickName: nickName,
      currentPlace: UpdatePlaceInformationPayload(
        countryName: currentCountry!.name!,
        provinceName: currentProvince!.name!,
        districtName: currentDistrict!.name!,
        wardName: currentWard!.name!,
        street: address,
        address: address,
        countryCode: currentCountry!.iso2!,
        provinceCode: currentProvince!.stateCode!.toString(),
        districtCode: currentDistrict!.code!,
        wardCode: currentWard!.id!.toString(),
      ),
      height: 1,
      weight: 1,
      maritalStatus: martialStatusParam,
      bloodGroup: bloodTypeParam,
      academicLevel: eduParam,
      job: jobParam,
      interest: hobbyParam,
      talent: talentParam,
      sex: genderParam,
      birthPlace: UpdatePDoneBirthPlacePayload2(
        countryName: currentCountry!.name!,
        provinceName: currentProvince!.name!,
        districtName: currentDistrict!.name!,
        wardName: currentWard!.name!,
        street: address,
        address: address,
        countryCode: currentCountry!.iso2!,
        countryId: currentCountry!.id!,
        provinceId: currentProvince!.stateCode!,
        districtId:
            currentDistrict?.code != null && currentDistrict!.code!.isNotEmpty ? int.parse(currentDistrict!.code!) : 0,
        wardId: currentWard!.id!,
      ),
      birthday: birthDay.toString(),
      identityNumber: idNumber,
      supplyDate: supplyDate.toString(),
      supplyAddress: placeOfNumber,
    );
  }

  UpdatePDoneProfilePayload passPdonePayload() {
    return UpdatePDoneProfilePayload(
      nickName: nickNameTxtController.text,
      currentPlace: UpdatePlaceInformationPayload(
        countryName: currentCountry!.name!,
        provinceName: currentProvince!.name!,
        districtName: currentDistrict!.name!,
        wardName: currentWard!.name!,
        street: addressTxtController.text,
        address: addressTxtController.text,
        countryCode: currentCountry!.iso2!,
        provinceCode: currentProvince!.stateCode!.toStringAsFixed(0),
        districtCode: currentDistrict!.code!,
        wardCode: currentWard!.id!.toStringAsFixed(0),
      ),
      height: 1,
      weight: 1,
      maritalStatus: martialStatusParam,
      bloodGroup: bloodTypeParam,
      academicLevel: eduParam,
      job: jobParam,
      interest: hobbyParam,
      talent: talentParam,
    );
  }

  @override
  void dispose() {
    middleNameTxtController.dispose();
    lastNameTxtController.dispose();
    firstNameTxtController.dispose();
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
