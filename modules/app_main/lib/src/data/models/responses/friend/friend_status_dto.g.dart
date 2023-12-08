// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendStatusDto _$FriendStatusDtoFromJson(Map<String, dynamic> json) =>
    FriendStatusDto(
      relation: RelationDto.fromJson(json['relation'] as Map<String, dynamic>),
      stats: StatsDto.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendStatusDtoToJson(FriendStatusDto instance) =>
    <String, dynamic>{
      'relation': instance.relation,
      'stats': instance.stats,
    };
