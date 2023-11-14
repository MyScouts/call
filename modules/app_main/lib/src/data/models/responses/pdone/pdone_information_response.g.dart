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
      type: json['type'] as int?,
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
      'supplyDate': instance.supplyDate,
      'type': instance.type,
    };
