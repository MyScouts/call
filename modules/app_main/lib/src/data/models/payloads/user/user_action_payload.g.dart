// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_action_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportUserPayload _$ReportUserPayloadFromJson(Map<String, dynamic> json) =>
    ReportUserPayload(
      content: json['content'] as String,
    );

Map<String, dynamic> _$ReportUserPayloadToJson(ReportUserPayload instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

FollowUserPayload _$FollowUserPayloadFromJson(Map<String, dynamic> json) =>
    FollowUserPayload(
      id: json['id'] as int,
    );

Map<String, dynamic> _$FollowUserPayloadToJson(FollowUserPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UnFollowPayload _$UnFollowPayloadFromJson(Map<String, dynamic> json) =>
    UnFollowPayload(
      id: json['id'] as int,
    );

Map<String, dynamic> _$UnFollowPayloadToJson(UnFollowPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
