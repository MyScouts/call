// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      status: json['status'] as int?,
      pDoneId: json['pDoneId'] as String?,
      displayName: json['displayName'] as String?,
      isPDone: json['isPDone'] as bool?,
      backgroundImages: (json['backgroundImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultBackground: json['defaultBackground'] as String?,
      isJA: json['isJA'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'status': instance.status,
      'pDoneId': instance.pDoneId,
      'displayName': instance.displayName,
      'isPDone': instance.isPDone,
      'backgroundImages': instance.backgroundImages,
      'defaultBackground': instance.defaultBackground,
      'isJA': instance.isJA,
    };
