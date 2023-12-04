
import 'package:app_main/src/domain/entities/call/call_history_model.dart';

abstract class CallHistoryResponseModel {
  int get count;
  List<CallHistoryModel> get items;
}