// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marshop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListMarshopResponseImpl _$$ListMarshopResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListMarshopResponseImpl(
      total: json['total'] as int,
      marshops: (json['marshops'] as List<dynamic>)
          .map((e) => MarshopResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListMarshopResponseImplToJson(
        _$ListMarshopResponseImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'marshops': instance.marshops,
    };

_$MarshopResponseImpl _$$MarshopResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      user: MarshopUserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MarshopResponseImplToJson(
        _$MarshopResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'user': instance.user,
    };

_$MarshopUserInfoImpl _$$MarshopUserInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$MarshopUserInfoImpl(
      id: json['id'] as int,
      displayName: json['displayName'] as String,
      pDoneId: json['pDoneId'] as String,
      fullName: json['fullName'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$$MarshopUserInfoImplToJson(
        _$MarshopUserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'pDoneId': instance.pDoneId,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
    };
