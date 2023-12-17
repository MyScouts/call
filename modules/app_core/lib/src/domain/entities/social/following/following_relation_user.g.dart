// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_relation_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingRelationUserImpl _$$FollowingRelationUserImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingRelationUserImpl(
      user: json['user'] == null
          ? null
          : FollowingUser.fromJson(json['user'] as Map<String, dynamic>),
      relation: json['relation'] == null
          ? null
          : FollowingRelation.fromJson(
              json['relation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowingRelationUserImplToJson(
        _$FollowingRelationUserImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'relation': instance.relation,
    };
