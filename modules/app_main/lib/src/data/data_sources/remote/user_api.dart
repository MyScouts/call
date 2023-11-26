import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/list_friends_user_response.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:app_main/src/data/models/responses/user_verify_response.dart';
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
  static const authOTP = 'api/v1/auth/otp';
  static const search = "api/v1/user/search";
  static const onboarding = "api/v1/onboarding/ecom";
  static const updatePDoneProfile = "api/v1/p-done/profile";
  static const updateNonePDoneProfile = "api/v1/p-done/non-p-done-profile";
  static const listFriends = "/api/v1/following/friend";
  static const invite = "api/v1/team/{id}/invite";
  static const email = "api/v1/user/email";
  static const genEmail = "api/v1/user/add-email-otp";
  static const updateAvatar = "api/v1/user";
  static const setConfig = "api/v1/setting/personal/{key}";
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

  @POST(UserApiConstants.authOTP)
  Future genOTP();

  @GET(UserApiConstants.search)
  Future<SearchUserResponse> searchUser(@Queries() SearchUserPayload query);

  @GET(UserApiConstants.onboarding)
  Future<OnboardingResponse> onboarding();

  @PATCH(UserApiConstants.updatePDoneProfile)
  Future<UpdateNonePDoneProfileReponse> updatePDoneProfile(
      @Body() UpdateNonePDoneProfilePayload updatePDoneProfilePayload);

  @GET(UserApiConstants.updatePDoneProfile)
  Future<UpdateNonePDoneProfileReponse> getPDoneProfile();

  @PATCH(UserApiConstants.updateNonePDoneProfile)
  Future<UpdateNonePDoneProfileReponse> updateNonePDoneProfile(
      @Body() Map<String, dynamic> data);

  @GET(UserApiConstants.listFriends)
  Future<ListFriendUserResponse> listFriends();

  @POST(UserApiConstants.invite)
  Future invite(
    @Body() Map<String, dynamic> json,
    @Path('id') String teamID,
  );

  @PATCH(UserApiConstants.email)
  Future<UserVerifyResponse> updateEmail(@Body() Map<String, dynamic> json);

  @POST(UserApiConstants.genEmail)
  Future<Object> genOtpEmail(@Body() Map<String, dynamic> json);

  @PATCH(UserApiConstants.updateAvatar)
  Future updateAvatar(@Body() Map<String, dynamic> json);

  @PUT(UserApiConstants.setConfig)
  Future setConfig(
    @Path('key') String key,
    @Body() Map<String, dynamic> json,
  );

  @GET(UserApiConstants.setConfig)
  Future<dynamic> getConfig(@Path('key') String key);
}
