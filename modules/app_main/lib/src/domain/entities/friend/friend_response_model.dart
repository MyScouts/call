

import 'package:app_main/src/domain/entities/chat/member_model.dart';

abstract class FriendResponseModel {
  List<MemberModel> get friends;
  int get total;
}