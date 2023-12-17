import 'package:app_main/src/domain/entities/chat/member_model.dart';

import 'meta_data_model.dart';

abstract class MessageModel {
  String get messageId;
  int get conversationId;
  int get type;
  MemberModel? get sender;
  bool get seen;
  DateTime get createdAt;
  String? get message;
  String? get des;
  MetaDataModel? get metadata;
}
