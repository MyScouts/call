// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      isProvincialGroup: json['isProvincialGroup'] as bool?,
      avatar: json['avatar'] as String?,
      banner: json['banner'] as String?,
      introduction: json['introduction'] as String?,
      teamCount: json['teamCount'] as int?,
      openTeamCount: json['openTeamCount'] as int?,
      boss: json['boss'] == null
          ? null
          : User.fromJson(json['boss'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isProvincialGroup': instance.isProvincialGroup,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'introduction': instance.introduction,
      'teamCount': instance.teamCount,
      'openTeamCount': instance.openTeamCount,
      'boss': instance.boss,
    };
