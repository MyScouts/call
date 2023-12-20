import 'package:app_main/src/data/models/responses/chat/message_dto.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:json_annotation/json_annotation.dart';

import 'member_response_dto.dart';
part 'conversation_dto.g.dart';

@JsonSerializable()
class ConversationDto extends ConversationModel {
  factory ConversationDto.fromJson(Map<String, dynamic> json) => _$ConversationDtoFromJson(json);

  ConversationDto(
      {required this.countUnSeen,
      required this.id,
      required this.latestMessage,
      required this.members,
      required this.name,
      required this.type});

  Map<String, dynamic> toJson() => _$ConversationDtoToJson(this);

  @override
  final int countUnSeen;

  @override
  final int id;

  @override
  final MessageDto? latestMessage;

  @override
  final List<MemberResponseDto> members;

  @override
  String? name;

  @override
  final int type;

  @override
  List<MemberResponseDto> get membersNotMe => [
        ...members.where((element) =>
            getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id != element.member.id)
      ];

  @override
  ConversationDto copyWithName({String? name}) {
    return ConversationDto(
        countUnSeen: countUnSeen,
        id: id,
        latestMessage: latestMessage,
        members: members,
        name: name,
        type: type);
  }
}
