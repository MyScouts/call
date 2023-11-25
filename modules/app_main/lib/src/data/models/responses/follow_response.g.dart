// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserFollowDetailResponseImpl _$$GetUserFollowDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserFollowDetailResponseImpl(
      stats: GetUserFollowStartResponse.fromJson(
          json['stats'] as Map<String, dynamic>),
      relation: GetUserFollowRelationResponse.fromJson(
          json['relation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserFollowDetailResponseImplToJson(
        _$GetUserFollowDetailResponseImpl instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'relation': instance.relation,
    };

_$GetUserFollowStartResponseImpl _$$GetUserFollowStartResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserFollowStartResponseImpl(
      friendCount: json['friendCount'] as int,
      followerCount: json['followerCount'] as int,
      followeeCount: json['followeeCount'] as int,
    );

Map<String, dynamic> _$$GetUserFollowStartResponseImplToJson(
        _$GetUserFollowStartResponseImpl instance) =>
    <String, dynamic>{
      'friendCount': instance.friendCount,
      'followerCount': instance.followerCount,
      'followeeCount': instance.followeeCount,
    };

_$GetUserFollowRelationResponseImpl
    _$$GetUserFollowRelationResponseImplFromJson(Map<String, dynamic> json) =>
        _$GetUserFollowRelationResponseImpl(
          isFriend: json['isFriend'] as bool,
          isFollower: json['isFollower'] as bool,
          isFollowee: json['isFollowee'] as bool,
        );

Map<String, dynamic> _$$GetUserFollowRelationResponseImplToJson(
        _$GetUserFollowRelationResponseImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'isFollower': instance.isFollower,
      'isFollowee': instance.isFollowee,
    };
