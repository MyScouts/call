// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsDto _$StatsDtoFromJson(Map<String, dynamic> json) => StatsDto(
      followeeCount: json['followeeCount'] as int,
      followerCount: json['followerCount'] as int,
      friendCount: json['friendCount'] as int,
    );

Map<String, dynamic> _$StatsDtoToJson(StatsDto instance) => <String, dynamic>{
      'followeeCount': instance.followeeCount,
      'followerCount': instance.followerCount,
      'friendCount': instance.friendCount,
    };
