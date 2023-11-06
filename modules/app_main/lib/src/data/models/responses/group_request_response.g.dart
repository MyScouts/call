// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupRequestResponse _$GroupRequestResponseFromJson(
        Map<String, dynamic> json) =>
    GroupRequestResponse(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => GroupRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupRequestResponseToJson(
        GroupRequestResponse instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };

GroupRequest _$GroupRequestFromJson(Map<String, dynamic> json) => GroupRequest(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupRequestToJson(GroupRequest instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'team': instance.team,
    };
