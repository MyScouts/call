// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_followees_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFolloweesResponse _$ListFolloweesResponseFromJson(
        Map<String, dynamic> json) =>
    ListFolloweesResponse(
      followees: (json['followees'] as List<dynamic>?)
          ?.map((e) => FolloweesUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$ListFolloweesResponseToJson(
        ListFolloweesResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'followees': instance.followees,
    };

FolloweesUser _$FolloweesUserFromJson(Map<String, dynamic> json) =>
    FolloweesUser(
      isFriend: json['isFriend'] as bool,
      followee: User.fromJson(json['followee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FolloweesUserToJson(FolloweesUser instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'followee': instance.followee,
    };
