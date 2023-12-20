import 'package:app_main/src/domain/entities/chat/message_model.dart';

import 'member_response_model.dart';

abstract class ConversationModel {
  int get id;
  int get type;
  int get countUnSeen;
  String? get name;
  List<MemberResponseModel> get members;
  List<MemberResponseModel> get membersNotMe;
  MessageModel? get latestMessage;

  ConversationModel copyWithName({String? name});
}
