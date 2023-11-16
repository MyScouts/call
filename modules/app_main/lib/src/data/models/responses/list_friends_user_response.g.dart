// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_friends_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFriendUserResponse _$ListFriendUserResponseFromJson(
        Map<String, dynamic> json) =>
    ListFriendUserResponse(
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$ListFriendUserResponseToJson(
        ListFriendUserResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'friends': instance.friends,
    };
