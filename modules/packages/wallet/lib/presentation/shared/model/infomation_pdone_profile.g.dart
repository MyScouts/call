// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infomation_pdone_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PDoneProfileImpl _$$PDoneProfileImplFromJson(Map<String, dynamic> json) =>
    _$PDoneProfileImpl(
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      nickName: json['nickName'] as String?,
      sex: json['sex'] as int?,
      identityNumber: json['identityNumber'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$$PDoneProfileImplToJson(_$PDoneProfileImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'nickName': instance.nickName,
      'sex': instance.sex,
      'identityNumber': instance.identityNumber,
      'birthday': instance.birthday,
    };
