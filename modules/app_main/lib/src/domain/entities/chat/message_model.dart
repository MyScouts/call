
import 'package:app_main/src/domain/entities/chat/member_model.dart';

abstract class MessageModel {
  String get messageId;
  int get conversationId;
  int get type;
  MemberModel? get sender;
  bool get seen;
  String get createdAt;
  String get message;
  Map? get metadata;
}