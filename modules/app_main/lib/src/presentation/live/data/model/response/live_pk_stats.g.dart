// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pk_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePkStatsRes _$LivePkStatsResFromJson(Map<String, dynamic> json) =>
    LivePkStatsRes(
      pkStats: (json['pkStats'] as List<dynamic>)
          .map((e) => LivePkStats.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LivePkStatsResToJson(LivePkStatsRes instance) =>
    <String, dynamic>{
      'pkStats': instance.pkStats,
    };

LivePkStats _$LivePkStatsFromJson(Map<String, dynamic> json) => LivePkStats(
      diamondCount: json['diamondCount'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LivePkStatsToJson(LivePkStats instance) =>
    <String, dynamic>{
      'diamondCount': instance.diamondCount,
      'user': instance.user,
    };
