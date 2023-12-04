// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_message_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMessagePayload _$NewMessagePayloadFromJson(Map<String, dynamic> json) =>
    NewMessagePayload(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetaDataDto.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewMessagePayloadToJson(NewMessagePayload instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
    };
