// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['id'] as int,
      avatar: json['avatar'] as String?,
      displayName: json['displayName'] as String,
      pDoneId: json['pDoneId'] as String,
      fullName: json['fullName'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      phone: json['phone'] as String,
      email: json['email'] as String?,
      sexCode: json['sexCode'] as int?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'displayName': instance.displayName,
      'pDoneId': instance.pDoneId,
      'fullName': instance.fullName,
      'birthday': instance.birthday?.toIso8601String(),
      'phone': instance.phone,
      'email': instance.email,
      'sexCode': instance.sexCode,
    };
