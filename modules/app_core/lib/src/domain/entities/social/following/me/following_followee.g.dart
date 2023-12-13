// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_followee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingFolloweeImpl _$$FollowingFolloweeImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingFolloweeImpl(
      isFriend: json['isFriend'] as bool?,
      followee: json['followee'] == null
          ? null
          : FollowingUser.fromJson(json['followee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowingFolloweeImplToJson(
        _$FollowingFolloweeImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'followee': instance.followee,
    };
