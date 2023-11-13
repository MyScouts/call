// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReplyJoinRequestPayloadImpl _$$ReplyJoinRequestPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$ReplyJoinRequestPayloadImpl(
      userId: json['userId'] as int,
      isApproved: json['isApproved'] as bool,
    );

Map<String, dynamic> _$$ReplyJoinRequestPayloadImplToJson(
        _$ReplyJoinRequestPayloadImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isApproved': instance.isApproved,
    };

_$AssignBossPayloadImpl _$$AssignBossPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$AssignBossPayloadImpl(
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$$AssignBossPayloadImplToJson(
        _$AssignBossPayloadImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

_$GetCommunityPayloadImpl _$$GetCommunityPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCommunityPayloadImpl(
      teamId: json['teamId'] as String,
    );

Map<String, dynamic> _$$GetCommunityPayloadImplToJson(
        _$GetCommunityPayloadImpl instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
    };
