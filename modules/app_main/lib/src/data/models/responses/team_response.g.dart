// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) => TeamResponse(
      teams: (json['teams'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeamResponseToJson(TeamResponse instance) =>
    <String, dynamic>{
      'teams': instance.teams,
    };

TeamByIdResponse _$TeamByIdResponseFromJson(Map<String, dynamic> json) =>
    TeamByIdResponse(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamByIdResponseToJson(TeamByIdResponse instance) =>
    <String, dynamic>{
      'team': instance.team,
    };
