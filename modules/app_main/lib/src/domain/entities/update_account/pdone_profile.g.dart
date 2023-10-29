// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdone_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PDoneProfileImpl _$$PDoneProfileImplFromJson(Map<String, dynamic> json) =>
    _$PDoneProfileImpl(
      birthPlace: json['birthPlace'] == null
          ? null
          : PlaceInformation.fromJson(
              json['birthPlace'] as Map<String, dynamic>),
      currentPlace: json['currentPlace'] == null
          ? null
          : PlaceInformation.fromJson(
              json['currentPlace'] as Map<String, dynamic>),
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      nickname: json['nickname'] as String?,
      sex: json['sex'] == null
          ? null
          : Gender.fromJson(json['sex'] as Map<String, dynamic>),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      protector: json['protector'] == null
          ? null
          : Protector.fromJson(json['protector'] as Map<String, dynamic>),
      protectorPDoneId: json['protectorPDoneId'] as String?,
      identityNumber: json['identityNumber'] as String?,
      supplyDate: json['supplyDate'] == null
          ? null
          : DateTime.parse(json['supplyDate'] as String),
      supplyAddress: json['supplyAddress'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      bloodGroup: json['bloodGroup'] == null
          ? null
          : BloodGroup.fromJson(json['bloodGroup'] as Map<String, dynamic>),
      maritalStatus: json['maritalStatus'] == null
          ? null
          : MaritalStatus.fromJson(
              json['maritalStatus'] as Map<String, dynamic>),
      academicLevel: json['academicLevel'] == null
          ? null
          : AcademicLevel.fromJson(
              json['academicLevel'] as Map<String, dynamic>),
      job: json['job'] == null
          ? null
          : Job.fromJson(json['job'] as Map<String, dynamic>),
      interest: json['interest'] == null
          ? null
          : Interest.fromJson(json['interest'] as Map<String, dynamic>),
      talent: json['talent'] == null
          ? null
          : Talent.fromJson(json['talent'] as Map<String, dynamic>),
      protectorInfo: json['protectorInfo'] == null
          ? null
          : User.fromJson(json['protectorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PDoneProfileImplToJson(_$PDoneProfileImpl instance) =>
    <String, dynamic>{
      'birthPlace': instance.birthPlace?.toJson(),
      'currentPlace': instance.currentPlace?.toJson(),
      'id': instance.id,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'nickname': instance.nickname,
      'sex': instance.sex?.toJson(),
      'birthday': instance.birthday?.toIso8601String(),
      'protector': instance.protector?.toJson(),
      'protectorPDoneId': instance.protectorPDoneId,
      'identityNumber': instance.identityNumber,
      'supplyDate': instance.supplyDate?.toIso8601String(),
      'supplyAddress': instance.supplyAddress,
      'height': instance.height,
      'weight': instance.weight,
      'bloodGroup': instance.bloodGroup?.toJson(),
      'maritalStatus': instance.maritalStatus?.toJson(),
      'academicLevel': instance.academicLevel?.toJson(),
      'job': instance.job?.toJson(),
      'interest': instance.interest?.toJson(),
      'talent': instance.talent?.toJson(),
      'protectorInfo': instance.protectorInfo?.toJson(),
    };
