// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingInfoImpl _$$FollowingInfoImplFromJson(Map<String, dynamic> json) =>
    _$FollowingInfoImpl(
      total: json['total'] as int?,
      info: (json['info'] as List<dynamic>?)
          ?.map(
              (e) => FollowingRelationUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingInfoImplToJson(_$FollowingInfoImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'info': instance.info,
    };
