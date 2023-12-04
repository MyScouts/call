// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_friend_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteFriendReq _$InviteFriendReqFromJson(Map<String, dynamic> json) =>
    InviteFriendReq(
      userIds:
          (json['userIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$InviteFriendReqToJson(InviteFriendReq instance) =>
    <String, dynamic>{
      'userIds': instance.userIds,
    };
