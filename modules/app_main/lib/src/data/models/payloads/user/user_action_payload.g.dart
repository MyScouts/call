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

DeleteUserPayload _$DeleteUserPayloadFromJson(Map<String, dynamic> json) =>
    DeleteUserPayload(
      password: json['password'] as String,
    );

Map<String, dynamic> _$DeleteUserPayloadToJson(DeleteUserPayload instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

SearchUserPayload _$SearchUserPayloadFromJson(Map<String, dynamic> json) =>
    SearchUserPayload(
      query: json['query'] as String,
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
    );

Map<String, dynamic> _$SearchUserPayloadToJson(SearchUserPayload instance) =>
    <String, dynamic>{
      'query': instance.query,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
