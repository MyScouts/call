// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => MessageDto(
      conversationId: json['conversationId'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      message: json['message'] as String?,
      messageId: json['messageId'] as String,
      metadata: json['metadata'] == null
          ? null
          : MetaDataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      seen: json['seen'] as bool,
      sender: json['sender'] == null
          ? null
          : MemberDto.fromJson(json['sender'] as Map<String, dynamic>),
      type: json['type'] as int,
    );

Map<String, dynamic> _$MessageDtoToJson(MessageDto instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'createdAt': instance.createdAt.toIso8601String(),
      'message': instance.message,
      'messageId': instance.messageId,
      'metadata': instance.metadata,
      'seen': instance.seen,
      'sender': instance.sender,
      'type': instance.type,
    };
