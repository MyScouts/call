// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_conversations_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewConversationsPayload _$NewConversationsPayloadFromJson(
        Map<String, dynamic> json) =>
    NewConversationsPayload(
      name: json['name'] as String,
      type: json['type'] as int,
      memberIds:
          (json['memberIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$NewConversationsPayloadToJson(
        NewConversationsPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'memberIds': instance.memberIds,
    };
