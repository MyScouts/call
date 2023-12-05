// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_follower_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFollowerUserResponse _$ListFollowerUserResponseFromJson(
        Map<String, dynamic> json) =>
    ListFollowerUserResponse(
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$ListFollowerUserResponseToJson(
        ListFollowerUserResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'followers': instance.followers,
    };
