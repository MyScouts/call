// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_user_followers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingUserFollowersImpl _$$FollowingUserFollowersImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingUserFollowersImpl(
      total: json['total'] as int?,
      followers: (json['followers'] as List<dynamic>?)
          ?.map(
              (e) => FollowingRelationUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingUserFollowersImplToJson(
        _$FollowingUserFollowersImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'followers': instance.followers,
    };
