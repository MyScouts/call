// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_user_followees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingUserFolloweesImpl _$$FollowingUserFolloweesImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingUserFolloweesImpl(
      total: json['total'] as int?,
      followees: (json['followees'] as List<dynamic>?)
          ?.map(
              (e) => FollowingRelationUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingUserFolloweesImplToJson(
        _$FollowingUserFolloweesImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'followees': instance.followees,
    };
