import 'package:app_main/src/data/data_sources/remote/call_api.dart';
import 'package:app_main/src/data/models/payloads/call/new_call_payload.dart';
import 'package:app_main/src/data/models/payloads/call/update_call_payload.dart';
import 'package:app_main/src/domain/entities/call/call_history_response_model.dart';
import 'package:app_main/src/domain/entities/call/result_response_model.dart';
import 'package:app_main/src/domain/repository/call_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CallRepository)
class CallRepositoryImpl extends CallRepository {
  final CallApi _client;

  CallRepositoryImpl(this._client);

  @override
  Future<CallHistoryResponseModel> getCallHistory(
      {required int page, required int pageSize, String? search, int? receiverId}) async {
    return await _client.getCallHistory(page, pageSize, search, receiverId);
  }

  @override
  Future<ResultResponseModel> newCall({required NewCallPayload payload}) async {
    return await _client.newCall(payload: payload);
  }

  @override
  Future<void> updateCall({required int callId, required UpdateCallPayload payload}) async {
    return await _client.updateCall(historyId: callId, payload: payload);
  }
}
