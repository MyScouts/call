// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_user_friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingUserFriendsImpl _$$FollowingUserFriendsImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingUserFriendsImpl(
      total: json['total'] as int?,
      friends: (json['friends'] as List<dynamic>?)
          ?.map(
              (e) => FollowingRelationUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingUserFriendsImplToJson(
        _$FollowingUserFriendsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'friends': instance.friends,
    };
