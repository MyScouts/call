// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_join_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberJoinRequestResponseImpl _$$MemberJoinRequestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberJoinRequestResponseImpl(
      requests: (json['requests'] as List<dynamic>)
          .map((e) => RequestDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MemberJoinRequestResponseImplToJson(
        _$MemberJoinRequestResponseImpl instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };

_$RequestDetailImpl _$$RequestDetailImplFromJson(Map<String, dynamic> json) =>
    _$RequestDetailImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RequestDetailImplToJson(_$RequestDetailImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'team': instance.team,
    };
