import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/api_response.dart';

part 'user_api.g.dart';

class UserApiConstants {
  static const pDoneProfile = 'api/account-p-done/profile';
  static const userById = 'api/users/{id}';
  static const reportUser = 'api/users/report-user/{id}';
  static const followUser = 'api/users/follow';
  static const unFollow = 'api/users/unfollow';
  static const blockUser = 'api/users/block-user/{userId}';
}

@RestApi()
@injectable
abstract class UserApi {
  @factoryMethod
  factory UserApi(Dio dio) = _UserApi;

  @GET(UserApiConstants.pDoneProfile)
  Future<ApiResponse<User?>> getProfile();

  @GET(UserApiConstants.userById)
  Future<ApiResponse<User?>> getUserById({
    @Path('id') required int id,
  });

  @DELETE(UserApiConstants.userById)
  Future deleteById({
    @Path('id') required int id,
    @Body() required DeleteUserPayload payload,
  });

  @POST(UserApiConstants.reportUser)
  Future reportUser({
    @Path('id') required int id,
    @Body() required ReportUserPayload body,
  });

  @POST(UserApiConstants.followUser)
  Future<ApiResponse<FollowUserResponse>> followUser({
    @Body() required FollowUserPayload body,
  });

  @POST(UserApiConstants.unFollow)
  Future unFollow({
    @Body() required UnFollowPayload body,
  });

  @POST(UserApiConstants.blockUser)
  Future blockUser(@Path() int userId);
}
