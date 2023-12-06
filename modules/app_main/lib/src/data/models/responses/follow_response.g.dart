// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserFollowDetailResponseImpl _$$GetUserFollowDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserFollowDetailResponseImpl(
      stats: GetUserFollowStartResponse.fromJson(
          json['stats'] as Map<String, dynamic>),
      relation: GetUserFollowRelationResponse.fromJson(
          json['relation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserFollowDetailResponseImplToJson(
        _$GetUserFollowDetailResponseImpl instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'relation': instance.relation,
    };

_$GetUserFollowStartResponseImpl _$$GetUserFollowStartResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserFollowStartResponseImpl(
      friendCount: json['friendCount'] as int,
      followerCount: json['followerCount'] as int,
      followeeCount: json['followeeCount'] as int,
    );

Map<String, dynamic> _$$GetUserFollowStartResponseImplToJson(
        _$GetUserFollowStartResponseImpl instance) =>
    <String, dynamic>{
      'friendCount': instance.friendCount,
      'followerCount': instance.followerCount,
      'followeeCount': instance.followeeCount,
    };

_$GetUserFollowRelationResponseImpl
    _$$GetUserFollowRelationResponseImplFromJson(Map<String, dynamic> json) =>
        _$GetUserFollowRelationResponseImpl(
          isFriend: json['isFriend'] as bool,
          isFollower: json['isFollower'] as bool,
          isFollowee: json['isFollowee'] as bool,
        );

Map<String, dynamic> _$$GetUserFollowRelationResponseImplToJson(
        _$GetUserFollowRelationResponseImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'isFollower': instance.isFollower,
      'isFollowee': instance.isFollowee,
    };

_$ApprovedRequestResponseImpl _$$ApprovedRequestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ApprovedRequestResponseImpl(
      approvals: (json['approvals'] as List<dynamic>)
          .map((e) => ApprovedRequestDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApprovedRequestResponseImplToJson(
        _$ApprovedRequestResponseImpl instance) =>
    <String, dynamic>{
      'approvals': instance.approvals,
    };

_$ApprovedRequestDetailImpl _$$ApprovedRequestDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ApprovedRequestDetailImpl(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      followee: json['followee'] == null
          ? null
          : ApprovedRequestUser.fromJson(
              json['followee'] as Map<String, dynamic>),
      follower: json['follower'] == null
          ? null
          : ApprovedRequestUser.fromJson(
              json['follower'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApprovedRequestDetailImplToJson(
        _$ApprovedRequestDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'followee': instance.followee,
      'follower': instance.follower,
    };

_$ApprovedRequestUserImpl _$$ApprovedRequestUserImplFromJson(
        Map<String, dynamic> json) =>
    _$ApprovedRequestUserImpl(
      id: json['id'] as int,
      displayName: json['displayName'] as String,
      avatar: json['avatar'] as String?,
      pDoneId: json['pDoneId'] as String,
      fullName: json['fullName'] as String,
      birthday: json['birthday'] as String,
      sexCode: json['sexCode'] as int,
    );

Map<String, dynamic> _$$ApprovedRequestUserImplToJson(
        _$ApprovedRequestUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'avatar': instance.avatar,
      'pDoneId': instance.pDoneId,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'sexCode': instance.sexCode,
    };
