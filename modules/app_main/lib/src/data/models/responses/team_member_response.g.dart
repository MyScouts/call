// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamMemberResponse _$TeamMemberResponseFromJson(Map<String, dynamic> json) =>
    TeamMemberResponse(
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeamMemberResponseToJson(TeamMemberResponse instance) =>
    <String, dynamic>{
      'team': instance.team,
      'members': instance.members,
    };
