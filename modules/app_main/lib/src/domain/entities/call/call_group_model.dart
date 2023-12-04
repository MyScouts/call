

import 'package:app_main/src/domain/entities/chat/member_response_model.dart';

abstract class CallGroupModel {
  int get id;
  String? get name;
  int get type;
  List<MemberResponseModel> get members;
  List<MemberResponseModel> get membersNotMe;
}