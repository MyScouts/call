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
