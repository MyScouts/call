import 'package:app_main/src/data/models/payloads/call/new_call_payload.dart';
import 'package:app_main/src/data/models/payloads/call/update_call_payload.dart';
import 'package:app_main/src/data/models/responses/call/call_history_response_dto.dart';
import 'package:app_main/src/data/models/responses/call/result_response_dto.dart';
import 'package:app_main/src/data/models/responses/chat/result_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'call_api.g.dart';

class CallApiConstant {
  static const String getCallHistory = "api/v1/call/histories";
  static const String updateCall = "api/v1/call/histories/{historyId}";
}

@RestApi()
@injectable
abstract class CallApi {
  @factoryMethod
  factory CallApi(Dio dio) = _CallApi;

  @GET(CallApiConstant.getCallHistory)
  Future<CallHistoryResponseDto> getCallHistory(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('search') String? search,
    @Query('receiverId') int? receiverId,
  );

  @POST(CallApiConstant.getCallHistory)
  Future<ResultResponseDto> newCall({
    @Body() required NewCallPayload payload,
  });

  @PATCH(CallApiConstant.updateCall)
  Future<void> updateCall({
    @Path('historyId') required int historyId,
    @Body() required UpdateCallPayload payload,
  });

  @DELETE(CallApiConstant.getCallHistory)
  Future<ResultDto> deleteHistoryCall({
    @Query('historyIds') List<int>? historyIds,
    @Query('userId') int? userId,
    @Query('callGroupId') int? callGroupId,
  });
}
