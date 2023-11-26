// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaDataImpl _$$MetaDataImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataImpl(
      protectorOf: json['protectorOf'] as int?,
      pDoneId: json['pDoneId'] as String?,
      hourCount: json['hourCount'] as int?,
      fromUserId: json['fromUserId'] as int?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$MetaDataImplToJson(_$MetaDataImpl instance) =>
    <String, dynamic>{
      'protectorOf': instance.protectorOf,
      'pDoneId': instance.pDoneId,
      'hourCount': instance.hourCount,
      'fromUserId': instance.fromUserId,
      'role': instance.role,
    };
