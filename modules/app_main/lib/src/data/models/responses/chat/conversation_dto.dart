import 'package:app_main/src/data/models/responses/chat/member_dto.dart';
import 'package:app_main/src/data/models/responses/chat/message_dto.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversation_dto.g.dart';

@JsonSerializable()
class ConversationDto extends ConversationModel {
  
  factory ConversationDto.fromJson(Map<String, dynamic> json) => _$ConversationDtoFromJson(json);

  ConversationDto({required this.countUnSeen, required this.id, required this.latestMessage, required this.members, required this.name, required this.type});

  Map<String, dynamic> toJson() => _$ConversationDtoToJson(this);

  @override
  final int countUnSeen;

  @override
  final int id;

  @override
  final MessageDto latestMessage;

  @override
  final List<MemberDto> members;

  @override
  final String? name;

  @override
  final int type;
}