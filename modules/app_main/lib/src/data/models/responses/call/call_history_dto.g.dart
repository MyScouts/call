// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallHistoryDto _$CallHistoryDtoFromJson(Map<String, dynamic> json) =>
    CallHistoryDto(
      callGroup:
          CallGroupDto.fromJson(json['callGroup'] as Map<String, dynamic>),
      calledAt: json['calledAt'] as String?,
      endedAt: json['endedAt'] as String?,
      id: json['id'] as int,
      status: json['status'] as int,
      type: json['type'] as int,
      callerId: json['callerId'] as int,
    );

Map<String, dynamic> _$CallHistoryDtoToJson(CallHistoryDto instance) =>
    <String, dynamic>{
      'callGroup': instance.callGroup,
      'calledAt': instance.calledAt,
      'endedAt': instance.endedAt,
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'callerId': instance.callerId,
    };
