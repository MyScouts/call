

import 'package:app_main/src/domain/entities/call/call_group_model.dart';

abstract class CallHistoryModel {
  int get id;
  int get status;
  int get type;
  int get callerId;
  String? get calledAt;
  String? get endedAt;
  CallGroupModel get callGroup;
  bool get isCaller;
  String get des;
  bool get isMissingCall;


}