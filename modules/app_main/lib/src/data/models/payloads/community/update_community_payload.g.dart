// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_community_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateCommunityPayloadImpl _$$UpdateCommunityPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateCommunityPayloadImpl(
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      banner: json['banner'] as String?,
      introduction: json['introduction'] as String?,
    );

Map<String, dynamic> _$$UpdateCommunityPayloadImplToJson(
        _$UpdateCommunityPayloadImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'introduction': instance.introduction,
    };
