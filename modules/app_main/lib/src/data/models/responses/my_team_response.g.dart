// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_team_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyTeamResponseImpl _$$MyTeamResponseImplFromJson(Map<String, dynamic> json) =>
    _$MyTeamResponseImpl(
      teams: (json['teams'] as List<dynamic>?)
          ?.map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyTeamResponseImplToJson(
        _$MyTeamResponseImpl instance) =>
    <String, dynamic>{
      'teams': instance.teams,
    };
