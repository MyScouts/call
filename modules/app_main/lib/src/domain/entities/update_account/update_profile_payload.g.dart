// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateProfilePayloadImpl _$$UpdateProfilePayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProfilePayloadImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      nickname: json['nickname'] as String?,
      sex: json['sex'] as int?,
      birthday: json['birthday'] as String?,
      birthPlace: json['birthPlace'] as String?,
      currentPlace: json['currentPlace'] == null
          ? null
          : UpdatePlaceInformationPayload.fromJson(
              json['currentPlace'] as Map<String, dynamic>),
      identityNumber: json['identityNumber'] as String?,
      supplyDate: json['supplyDate'] as String?,
      supplyAddress: json['supplyAddress'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      maritalStatus: json['maritalStatus'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      academicLevel: json['academicLevel'] as String?,
      job: json['job'] as String?,
      interest: json['interest'] as String?,
      talent: json['talent'] as String?,
      protector: json['protector'] as int?,
      protectorPDoneId: json['protectorPDoneId'] as String?,
      protectorIdentityNumber: json['protectorIdentityNumber'] as String?,
      protectorEmailPhone: json['protectorEmailPhone'] as String?,
    );

Map<String, dynamic> _$$UpdateProfilePayloadImplToJson(
    _$UpdateProfilePayloadImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('middleName', instance.middleName);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('sex', instance.sex);
  writeNotNull('birthday', instance.birthday);
  writeNotNull('birthPlace', instance.birthPlace);
  writeNotNull('currentPlace', instance.currentPlace?.toJson());
  writeNotNull('identityNumber', instance.identityNumber);
  writeNotNull('supplyDate', instance.supplyDate);
  writeNotNull('supplyAddress', instance.supplyAddress);
  writeNotNull('height', instance.height);
  writeNotNull('weight', instance.weight);
  writeNotNull('maritalStatus', instance.maritalStatus);
  writeNotNull('bloodGroup', instance.bloodGroup);
  writeNotNull('academicLevel', instance.academicLevel);
  writeNotNull('job', instance.job);
  writeNotNull('interest', instance.interest);
  writeNotNull('talent', instance.talent);
  writeNotNull('protector', instance.protector);
  writeNotNull('protectorPDoneId', instance.protectorPDoneId);
  writeNotNull('protectorIdentityNumber', instance.protectorIdentityNumber);
  writeNotNull('protectorEmailPhone', instance.protectorEmailPhone);
  return val;
}
