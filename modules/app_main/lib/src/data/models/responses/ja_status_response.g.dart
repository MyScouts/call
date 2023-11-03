// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ja_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JAStatusResponse _$JAStatusResponseFromJson(Map<String, dynamic> json) =>
    JAStatusResponse(
      jaInfo: json['jaInfo'] == null
          ? null
          : JAStatusModel.fromJson(json['jaInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JAStatusResponseToJson(JAStatusResponse instance) =>
    <String, dynamic>{
      'jaInfo': instance.jaInfo,
    };

JAStatusModel _$JAStatusModelFromJson(Map<String, dynamic> json) =>
    JAStatusModel(
      id: json['id'] as int?,
      jaCode: json['jaCode'] as int?,
      teamId: json['teamId'] as String?,
      status: json['status'] as int?,
      jaAt:
          json['jaAt'] == null ? null : DateTime.parse(json['jaAt'] as String),
    );

Map<String, dynamic> _$JAStatusModelToJson(JAStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jaCode': instance.jaCode,
      'teamId': instance.teamId,
      'status': instance.status,
      'jaAt': instance.jaAt?.toIso8601String(),
    };
