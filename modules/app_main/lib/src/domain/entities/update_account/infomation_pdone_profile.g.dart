// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infomation_pdone_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InformationPdoneProfileImpl _$$InformationPdoneProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$InformationPdoneProfileImpl(
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      nickName: json['nickName'] as String,
      sex: json['sex'] as int,
      birthday: json['birthday'] as String,
      birthPlace: InformationPDoneBirthPlace.fromJson(
          json['birthPlace'] as Map<String, dynamic>),
      currentPlace: InformationDPoneCurrentPlace.fromJson(
          json['currentPlace'] as Map<String, dynamic>),
      height: json['height'] as int,
      weight: json['weight'] as int,
      maritalStatus: json['maritalStatus'] as String,
      bloodGroup: json['bloodGroup'] as String,
      academicLevel: json['academicLevel'] as String,
      job: json['job'] as String,
      interest: json['interest'] as String,
      talent: json['talent'] as String,
      identityNumber: json['identityNumber'] as String,
      supplyDate: json['supplyDate'] as String,
      supplyAddress: json['supplyAddress'] as String,
      protector: json['protector'] as int,
      protectorPDoneId: json['protectorPDoneId'] as String,
      birthCertificateUrl: json['birthCertificateUrl'] as String,
      birthCertificateSupplyDate: json['birthCertificateSupplyDate'] as String,
      kycMetadata: json['kycMetadata'] as Map<String, dynamic>,
      type: json['type'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$InformationPdoneProfileImplToJson(
        _$InformationPdoneProfileImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'nickName': instance.nickName,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'birthPlace': instance.birthPlace,
      'currentPlace': instance.currentPlace,
      'height': instance.height,
      'weight': instance.weight,
      'maritalStatus': instance.maritalStatus,
      'bloodGroup': instance.bloodGroup,
      'academicLevel': instance.academicLevel,
      'job': instance.job,
      'interest': instance.interest,
      'talent': instance.talent,
      'identityNumber': instance.identityNumber,
      'supplyDate': instance.supplyDate,
      'supplyAddress': instance.supplyAddress,
      'protector': instance.protector,
      'protectorPDoneId': instance.protectorPDoneId,
      'birthCertificateUrl': instance.birthCertificateUrl,
      'birthCertificateSupplyDate': instance.birthCertificateSupplyDate,
      'kycMetadata': instance.kycMetadata,
      'type': instance.type,
    };
