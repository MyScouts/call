import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/networking/api_response.dart';
import 'package:app_main/src/data/models/responses/live/join_live_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'live_api.g.dart';

class LivestreamApiConstant {
  static const String joinLive = 'api/live/{id}/join';
  static const String getListLiveMember = 'api/live/{id}/members';
}

@lazySingleton
@RestApi()
abstract class LiveAPI {
  @factoryMethod
  factory LiveAPI(Dio dio) = _LiveAPI;

  @POST(LivestreamApiConstant.joinLive)
  Future<ApiResponse<JoinLiveResponse>> joinLive({
    @Path('id') required int id,
    @Field() String? password,
  });

  @GET(LivestreamApiConstant.getListLiveMember)
  Future<ApiResponse<LiveListMemberResponse>> getListMemberLive(
      {@Path('id') required int id});
}
