// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingUserImpl _$$FollowingUserImplFromJson(Map<String, dynamic> json) =>
    _$FollowingUserImpl(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      displayName: json['displayName'] as String?,
      pDoneId: json['pDoneId'] as String?,
      fullName: json['fullName'] as String?,
      birthday: json['birthday'] as String?,
      sexCode: json['sexCode'] as int?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$$FollowingUserImplToJson(_$FollowingUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'displayName': instance.displayName,
      'pDoneId': instance.pDoneId,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'sexCode': instance.sexCode,
      'type': instance.type,
    };
