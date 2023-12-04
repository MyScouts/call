

import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'member_dto.dart';
part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto extends MessageModel {
  
  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);

  MessageDto({required this.conversationId, required this.createdAt, required this.message, required this.messageId, required this.metadata, required this.seen, required this.sender, required this.type});

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);

  @override
  final int conversationId;

  @override
  final DateTime createdAt;

  @override
  final String message;

  @override
  final String messageId;

  @override
  final Map? metadata;

  @override
  final bool seen;

  @override
  final MemberDto? sender;

  @override
  final int type;
}