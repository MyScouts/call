import 'package:app_main/src/domain/entities/chat/conversation_detail_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'conversation_dto.dart';
part 'conversation_detail_response_dto.g.dart';

@JsonSerializable()
class ConversationDetailResponseDto extends ConversationDetailResponseModel {

  factory ConversationDetailResponseDto.fromJson(Map<String, dynamic> json) => _$ConversationDetailResponseDtoFromJson(json);

  ConversationDetailResponseDto({required this.conversation});

  Map<String, dynamic> toJson() => _$ConversationDetailResponseDtoToJson(this);

  @override
  final ConversationDto conversation;
}