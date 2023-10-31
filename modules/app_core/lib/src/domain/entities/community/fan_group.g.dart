// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fan_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FanGroup _$$_FanGroupFromJson(Map<String, dynamic> json) => _$_FanGroup(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      banner: json['banner'] as String?,
      introduction: json['introduction'] as String?,
      boss: json['boss'] == null
          ? null
          : User.fromJson(json['boss'] as Map<String, dynamic>),
      contests: (json['contests'] as List<dynamic>?)
          ?.map((e) => Contest.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBossGroup: json['totalBossGroup'] as int?,
      totalBossTeam: json['totalBossTeam'] as int?,
      totalMember: json['totalMember'] as int?,
    );

Map<String, dynamic> _$$_FanGroupToJson(_$_FanGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'introduction': instance.introduction,
      'boss': instance.boss,
      'contests': instance.contests,
      'totalBossGroup': instance.totalBossGroup,
      'totalBossTeam': instance.totalBossTeam,
      'totalMember': instance.totalMember,
    };
