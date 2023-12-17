// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinRequestResponseImpl _$$JoinRequestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$JoinRequestResponseImpl(
      requests: (json['requests'] as List<dynamic>)
          .map((e) => JoinRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$JoinRequestResponseImplToJson(
        _$JoinRequestResponseImpl instance) =>
    <String, dynamic>{
      'requests': instance.requests,
    };

_$JoinRequestImpl _$$JoinRequestImplFromJson(Map<String, dynamic> json) =>
    _$JoinRequestImpl(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JoinRequestImplToJson(_$JoinRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'team': instance.team,
    };
