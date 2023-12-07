import 'package:app_main/src/data/models/payloads/call/new_call_payload.dart';
import 'package:app_main/src/data/models/payloads/call/update_call_payload.dart';
import 'package:app_main/src/domain/entities/call/call_history_response_model.dart';
import 'package:app_main/src/domain/entities/call/result_response_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';

abstract class CallRepository {
  Future<CallHistoryResponseModel> getCallHistory(
      {required int page, required int pageSize, String? search, int? receiverId});

  Future<ResultResponseModel> newCall({required NewCallPayload payload});

  Future<void> updateCall(
      {required int callId, required UpdateCallPayload payload});

  Future<ResultModel> deleteHistoryCall(
      {List<int>? historyIds, int? userId, int? callGroupId});
}
