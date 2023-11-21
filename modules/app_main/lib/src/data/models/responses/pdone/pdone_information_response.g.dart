// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PDoneInformationResponse _$PDoneInformationResponseFromJson(
        Map<String, dynamic> json) =>
    PDoneInformationResponse(
      profile: PDoneInformationData.fromJson(
          json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PDoneInformationResponseToJson(
        PDoneInformationResponse instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

PDoneInformationData _$PDoneInformationDataFromJson(
        Map<String, dynamic> json) =>
    PDoneInformationData(
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      sex: json['sex'] as int?,
      birthday: json['birthday'] as String?,
      identityNumber: json['identityNumber'] as String?,
      supplyDate: json['supplyDate'] as String?,
      supplyAddress: json['supplyAddress'] as String?,
      type: json['type'] as int?,
      academicLevel: json['academicLevel'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      height: json['height'] as int?,
      interest: json['interest'] as String?,
      job: json['job'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      talent: json['talent'] as String?,
      weight: json['weight'] as int?,
      birthPlace: json['birthPlace'] == null
          ? null
          : Place.fromJson(json['birthPlace'] as Map<String, dynamic>),
      currentPlace: json['currentPlace'] == null
          ? null
          : Place.fromJson(json['currentPlace'] as Map<String, dynamic>),
      birthCertificateUrl: json['birthCertificateUrl'] as String?,
      protector: json['protector'] as int?,
      protectorPDoneId: json['protectorPDoneId'] as String?,
    );

Map<String, dynamic> _$PDoneInformationDataToJson(
        PDoneInformationData instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'identityNumber': instance.identityNumber,
      'birthPlace': instance.birthPlace,
      'currentPlace': instance.currentPlace,
      'supplyDate': instance.supplyDate,
      'supplyAddress': instance.supplyAddress,
      'type': instance.type,
      'height': instance.height,
      'weight': instance.weight,
      'maritalStatus': instance.maritalStatus,
      'bloodGroup': instance.bloodGroup,
      'academicLevel': instance.academicLevel,
      'job': instance.job,
      'interest': instance.interest,
      'talent': instance.talent,
      'protector': instance.protector,
      'protectorPDoneId': instance.protectorPDoneId,
      'birthCertificateUrl': instance.birthCertificateUrl,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      countryName: json['countryName'] as String? ?? '',
      provinceName: json['provinceName'] as String? ?? '',
      districtName: json['districtName'] as String? ?? '',
      wardName: json['wardName'] as String? ?? '',
      street: json['street'] as String? ?? '',
      address: json['address'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      countryId: json['countryId'] as int? ?? 0,
      provinceId: json['provinceId'] as int? ?? 0,
      districtId: json['districtId'] as int? ?? 0,
      wardId: json['wardId'] as int? ?? 0,
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'countryName': instance.countryName,
      'provinceName': instance.provinceName,
      'districtName': instance.districtName,
      'wardName': instance.wardName,
      'street': instance.street,
      'address': instance.address,
      'countryCode': instance.countryCode,
      'countryId': instance.countryId,
      'provinceId': instance.provinceId,
      'districtId': instance.districtId,
      'wardId': instance.wardId,
    };

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
      countryId: json['countryId'] as int?,
      districtId: json['districtId'] as int?,
      provinceId: json['provinceId'] as int?,
      wardId: json['wardId'] as int?,
      address: json['address'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      districtCode: json['districtCode'] as String?,
      districtName: json['districtName'] as String?,
      provinceCode: json['provinceCode'] as String?,
      provinceName: json['provinceName'] as String?,
      street: json['street'] as String?,
      wardCode: json['wardCode'] as String?,
      wardName: json['wardName'] as String?,
    );

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'provinceId': instance.provinceId,
      'districtId': instance.districtId,
      'wardId': instance.wardId,
      'countryName': instance.countryName,
      'provinceName': instance.provinceName,
      'districtName': instance.districtName,
      'wardName': instance.wardName,
      'street': instance.street,
      'address': instance.address,
      'countryCode': instance.countryCode,
      'provinceCode': instance.provinceCode,
      'districtCode': instance.districtCode,
      'wardCode': instance.wardCode,
    };
