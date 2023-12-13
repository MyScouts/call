// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_followees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingFolloweesImpl _$$FollowingFolloweesImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingFolloweesImpl(
      total: json['total'] as int?,
      followees: (json['followees'] as List<dynamic>?)
          ?.map((e) => FollowingFollowee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingFolloweesImplToJson(
        _$FollowingFolloweesImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'followees': instance.followees,
    };
