

import 'package:app_main/src/domain/entities/call/member_model.dart';

abstract class CallGroupModel {
  int get id;
  String? get name;
  int get type;
  List<MemberModel> get members;
}