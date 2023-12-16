// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_group_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenGroupRequestResponseImpl _$$OpenGroupRequestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenGroupRequestResponseImpl(
      request: json['request'] == null
          ? null
          : OpenGroupRequest.fromJson(json['request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OpenGroupRequestResponseImplToJson(
        _$OpenGroupRequestResponseImpl instance) =>
    <String, dynamic>{
      'request': instance.request,
    };

_$OpenGroupRequestImpl _$$OpenGroupRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenGroupRequestImpl(
      status: json['status'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$OpenGroupRequestImplToJson(
        _$OpenGroupRequestImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
