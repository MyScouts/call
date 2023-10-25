// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fan_group_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserFanGroupInfo _$$_UserFanGroupInfoFromJson(Map<String, dynamic> json) =>
    _$_UserFanGroupInfo(
      status: json['status'] as int?,
      fanGroupId: json['fanGroupId'] as int?,
      types: (json['types'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_UserFanGroupInfoToJson(_$_UserFanGroupInfo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'fanGroupId': instance.fanGroupId,
      'types': instance.types,
    };
