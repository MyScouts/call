// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_registering_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PDoneRegisteringProfileResponse _$PDoneRegisteringProfileResponseFromJson(
        Map<String, dynamic> json) =>
    PDoneRegisteringProfileResponse(
      registeringProfile: json['registeringProfile'] == null
          ? null
          : PDoneRegisteringProfileData.fromJson(
              json['registeringProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PDoneRegisteringProfileResponseToJson(
        PDoneRegisteringProfileResponse instance) =>
    <String, dynamic>{
      'registeringProfile': instance.registeringProfile,
    };

PDoneRegisteringProfileData _$PDoneRegisteringProfileDataFromJson(
        Map<String, dynamic> json) =>
    PDoneRegisteringProfileData(
      protector: json['protector'] as int,
      id: json['id'] as String,
      type: json['type'] as int,
      birthCertificateUrl: json['birthCertificateUrl'] as String,
      birthday: json['birthday'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      protectorPDoneId: json['protectorPDoneId'] as String,
      registeringStatus: json['registeringStatus'] as int,
      sex: json['sex'] as int,
    );

Map<String, dynamic> _$PDoneRegisteringProfileDataToJson(
        PDoneRegisteringProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'sex': instance.sex,
      'protector': instance.protector,
      'protectorPDoneId': instance.protectorPDoneId,
      'birthCertificateUrl': instance.birthCertificateUrl,
      'type': instance.type,
      'registeringStatus': instance.registeringStatus,
      'birthday': instance.birthday,
    };
