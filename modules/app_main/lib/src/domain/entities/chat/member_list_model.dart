
import 'package:app_main/src/domain/entities/chat/member_response_model.dart';

abstract class MemberListModel {
  int get count;
  List<MemberResponseModel> get members;
  List<MemberResponseModel> get membersNotMe;
}