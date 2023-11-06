// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowUserResponseImpl _$$FollowUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowUserResponseImpl(
      isFriend: json['isFriend'] as bool,
      isFollowed: json['isFollowed'] as bool,
    );

Map<String, dynamic> _$$FollowUserResponseImplToJson(
        _$FollowUserResponseImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'isFollowed': instance.isFollowed,
    };
