// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingFriendsImpl _$$FollowingFriendsImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingFriendsImpl(
      total: json['total'] as int?,
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => FollowingUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingFriendsImplToJson(
        _$FollowingFriendsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'friends': instance.friends,
    };
