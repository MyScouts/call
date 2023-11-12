// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boss_team_relinquish_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BossTeamRelinquishStatusResponse _$BossTeamRelinquishStatusResponseFromJson(
        Map<String, dynamic> json) =>
    BossTeamRelinquishStatusResponse(
      giveUpRequest: (json['giveUpRequest'] as List<dynamic>?)
          ?.map((e) => GiveUpRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BossTeamRelinquishStatusResponseToJson(
        BossTeamRelinquishStatusResponse instance) =>
    <String, dynamic>{
      'giveUpRequest': instance.giveUpRequest,
    };

GiveUpRequest _$GiveUpRequestFromJson(Map<String, dynamic> json) =>
    GiveUpRequest(
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

Map<String, dynamic> _$GiveUpRequestToJson(GiveUpRequest instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
      'team': instance.team,
    };
