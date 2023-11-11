// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InformationProfileImpl _$$InformationProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$InformationProfileImpl(
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      nickName: json['nickName'] as String,
      sex: json['sex'] as int,
      birthday: DateTime.parse(json['birthday'] as String),
      birthPlace:
          PlaceInformation.fromJson(json['birthPlace'] as Map<String, dynamic>),
      currentPlace: PlaceInformation.fromJson(
          json['currentPlace'] as Map<String, dynamic>),
      height: json['height'] as int,
      weight: json['weight'] as int,
      maritalStatus:
          MaritalStatus.fromJson(json['maritalStatus'] as Map<String, dynamic>),
      bloodGroup:
          BloodGroup.fromJson(json['bloodGroup'] as Map<String, dynamic>),
      academicLevel:
          AcademicLevel.fromJson(json['academicLevel'] as Map<String, dynamic>),
      job: Job.fromJson(json['job'] as Map<String, dynamic>),
      interest: Interest.fromJson(json['interest'] as Map<String, dynamic>),
      talent: Talent.fromJson(json['talent'] as Map<String, dynamic>),
      identityNumber: json['identityNumber'] as String,
      supplyDate: DateTime.parse(json['supplyDate'] as String),
      supplyAddress: json['supplyAddress'] as String,
      protector: Protector.fromJson(json['protector'] as Map<String, dynamic>),
      protectorPDoneId: json['protectorPDoneId'] as String,
      birthCertificateUrl: json['birthCertificateUrl'] as String,
      birthCertificateSupplyDate:
          DateTime.parse(json['birthCertificateSupplyDate'] as String),
      kycMetadata: json['kycMetadata'] as Map<String, dynamic>,
      type: json['type'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$InformationProfileImplToJson(
        _$InformationProfileImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'nickName': instance.nickName,
      'sex': instance.sex,
      'birthday': instance.birthday.toIso8601String(),
      'birthPlace': instance.birthPlace.toJson(),
      'currentPlace': instance.currentPlace.toJson(),
      'height': instance.height,
      'weight': instance.weight,
      'maritalStatus': instance.maritalStatus.toJson(),
      'bloodGroup': instance.bloodGroup.toJson(),
      'academicLevel': instance.academicLevel.toJson(),
      'job': instance.job.toJson(),
      'interest': instance.interest.toJson(),
      'talent': instance.talent.toJson(),
      'identityNumber': instance.identityNumber,
      'supplyDate': instance.supplyDate.toIso8601String(),
      'supplyAddress': instance.supplyAddress,
      'protector': instance.protector.toJson(),
      'protectorPDoneId': instance.protectorPDoneId,
      'birthCertificateUrl': instance.birthCertificateUrl,
      'birthCertificateSupplyDate':
          instance.birthCertificateSupplyDate.toIso8601String(),
      'kycMetadata': instance.kycMetadata,
      'type': instance.type,
    };
