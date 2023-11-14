// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatestVersionResponseImpl _$$LatestVersionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LatestVersionResponseImpl(
      appVersion: json['appVersion'] == null
          ? null
          : VersionResponse.fromJson(
              json['appVersion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LatestVersionResponseImplToJson(
        _$LatestVersionResponseImpl instance) =>
    <String, dynamic>{
      'appVersion': instance.appVersion,
    };

_$VersionResponseImpl _$$VersionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VersionResponseImpl(
      version: json['version'] as String,
      force: json['force'] as bool,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$VersionResponseImplToJson(
        _$VersionResponseImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'force': instance.force,
      'note': instance.note,
    };
