// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_follower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingFollowerImpl _$$FollowingFollowerImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingFollowerImpl(
      isFriend: json['isFriend'] as bool?,
      hasPendingApproval: json['hasPendingApproval'] as bool?,
      follower: json['follower'] == null
          ? null
          : FollowingUser.fromJson(json['follower'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowingFollowerImplToJson(
        _$FollowingFollowerImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'hasPendingApproval': instance.hasPendingApproval,
      'follower': instance.follower,
    };
