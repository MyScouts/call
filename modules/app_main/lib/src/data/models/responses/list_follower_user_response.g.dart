// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_follower_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFollowerUserResponse _$ListFollowerUserResponseFromJson(
        Map<String, dynamic> json) =>
    ListFollowerUserResponse(
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => FollowerUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$ListFollowerUserResponseToJson(
        ListFollowerUserResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'followers': instance.followers,
    };

FollowerUser _$FollowerUserFromJson(Map<String, dynamic> json) => FollowerUser(
      isFriend: json['isFriend'] as bool,
      follower: User.fromJson(json['follower'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowerUserToJson(FollowerUser instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'follower': instance.follower,
    };
