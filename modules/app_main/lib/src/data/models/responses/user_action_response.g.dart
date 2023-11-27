// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowUserResponseImpl _$$FollowUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowUserResponseImpl(
      isFriend: json['isFriend'] as bool?,
      approvalRequired: json['approvalRequired'] as bool,
    );

Map<String, dynamic> _$$FollowUserResponseImplToJson(
        _$FollowUserResponseImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'approvalRequired': instance.approvalRequired,
    };
