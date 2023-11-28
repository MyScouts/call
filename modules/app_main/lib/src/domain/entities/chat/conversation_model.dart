

import 'package:app_main/src/domain/entities/chat/message_model.dart';

import 'member_model.dart';

abstract class ConversationModel {
  int get id;
  int get type;
  int get countUnSeen;
  String? get name;
  List<MemberModel> get members;
  MessageModel get latestMessage;
}