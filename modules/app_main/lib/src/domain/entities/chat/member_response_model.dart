
import 'package:app_main/src/domain/entities/chat/member_model.dart';

abstract class MemberResponseModel {
  int? get type;
  MemberModel get member;
}