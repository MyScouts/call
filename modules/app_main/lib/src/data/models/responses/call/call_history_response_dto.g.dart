// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallHistoryResponseDto _$CallHistoryResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CallHistoryResponseDto(
      count: json['count'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => CallHistoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CallHistoryResponseDtoToJson(
        CallHistoryResponseDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
    };
