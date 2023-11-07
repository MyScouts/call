// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_team_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveTeamStatusResponse _$LeaveTeamStatusResponseFromJson(
        Map<String, dynamic> json) =>
    LeaveTeamStatusResponse(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => LeaveTeamRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaveTeamStatusResponseToJson(
        LeaveTeamStatusResponse instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };

LeaveTeamRequest _$LeaveTeamRequestFromJson(Map<String, dynamic> json) =>
    LeaveTeamRequest(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaveTeamRequestToJson(LeaveTeamRequest instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'team': instance.team,
    };
