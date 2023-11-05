// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fan_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FanGroupImpl _$$FanGroupImplFromJson(Map<String, dynamic> json) =>
    _$FanGroupImpl(
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

Map<String, dynamic> _$$FanGroupImplToJson(_$FanGroupImpl instance) =>
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
