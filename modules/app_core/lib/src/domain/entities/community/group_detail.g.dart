// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupDetail _$$_GroupDetailFromJson(Map<String, dynamic> json) =>
    _$_GroupDetail(
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GroupDetailToJson(_$_GroupDetail instance) =>
    <String, dynamic>{
      'team': instance.team,
      'group': instance.group,
    };
