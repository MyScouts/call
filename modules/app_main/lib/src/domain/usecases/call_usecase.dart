
import 'package:app_main/src/data/models/payloads/call/new_call_payload.dart';
import 'package:app_main/src/data/models/payloads/call/update_call_payload.dart';
import 'package:app_main/src/domain/entities/call/call_history_response_model.dart';
import 'package:app_main/src/domain/entities/call/result_response_model.dart';
import 'package:app_main/src/domain/repository/call_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CallUseCase {
  final CallRepository _repository;

  CallUseCase(
      this._repository,
      );

  Future<CallHistoryResponseModel> getCallHistory({required int page, required int pageSize, String? search, int? receiverId}) async {
    return await _repository.getCallHistory(page: page, pageSize: pageSize);
  }

  Future<ResultResponseModel> newCall({required NewCallPayload payload}) async {
    return await _repository.newCall(payload: payload);
  }

  Future<void> updateCall({required UpdateCallPayload payload, required int callId}) async {
    return await _repository.updateCall(payload: payload, callId: callId);
  }


}
