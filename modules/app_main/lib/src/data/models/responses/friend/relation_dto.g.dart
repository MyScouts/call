// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationDto _$RelationDtoFromJson(Map<String, dynamic> json) => RelationDto(
      hasPendingApproval: json['hasPendingApproval'] as bool,
      isBlocked: json['isBlocked'] as bool,
      isBlocking: json['isBlocking'] as bool,
      isFollowee: json['isFollowee'] as bool,
      isFollower: json['isFollower'] as bool,
      isFriend: json['isFriend'] as bool,
    );

Map<String, dynamic> _$RelationDtoToJson(RelationDto instance) =>
    <String, dynamic>{
      'hasPendingApproval': instance.hasPendingApproval,
      'isBlocked': instance.isBlocked,
      'isBlocking': instance.isBlocking,
      'isFollowee': instance.isFollowee,
      'isFollower': instance.isFollower,
      'isFriend': instance.isFriend,
    };
