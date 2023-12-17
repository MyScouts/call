// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_relation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingRelationImpl _$$FollowingRelationImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingRelationImpl(
      isFriend: json['isFriend'] as bool? ?? false,
      isFollower: json['isFollower'] as bool? ?? false,
      isFollowee: json['isFollowee'] as bool? ?? false,
      hasPendingApproval: json['hasPendingApproval'] as bool? ?? false,
      isBlocked: json['isBlocked'] as bool? ?? false,
      isBlocking: json['isBlocking'] as bool? ?? false,
    );

Map<String, dynamic> _$$FollowingRelationImplToJson(
        _$FollowingRelationImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'isFollower': instance.isFollower,
      'isFollowee': instance.isFollowee,
      'hasPendingApproval': instance.hasPendingApproval,
      'isBlocked': instance.isBlocked,
      'isBlocking': instance.isBlocking,
    };
