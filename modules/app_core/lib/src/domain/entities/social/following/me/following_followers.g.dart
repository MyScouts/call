// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_followers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingFollowersImpl _$$FollowingFollowersImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingFollowersImpl(
      total: json['total'] as int?,
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => FollowingFollower.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingFollowersImplToJson(
        _$FollowingFollowersImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'followers': instance.followers,
    };
