// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'react_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactPayload _$ReactPayloadFromJson(Map<String, dynamic> json) => ReactPayload(
      type: json['type'] as String,
      isHearted: json['isHearted'] as bool,
    );

Map<String, dynamic> _$ReactPayloadToJson(ReactPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
      'isHearted': instance.isHearted,
    };
