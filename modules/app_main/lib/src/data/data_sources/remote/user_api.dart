import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/data/models/responses/list_friends_user_response.dart';
import 'package:app_main/src/data/models/responses/search_user_response.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/user_action_response.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:app_main/src/data/models/responses/user_verify_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/api_response.dart';
import '../../models/responses/list_followees_response.dart';

part 'user_api.g.dart';

class UserApiConstants {
  static const pDoneProfile = 'api/account-p-done/profile';
  static const userById = 'api/users/{id}';
  static const reportUser = 'api/users/report-user/{id}';
  static const followUserById = 'api/v1/following/user/{userId}';
  static const followUser = 'api/v1/following/follow';
  static const unFollow = 'api/v1/following/unfollow';
  static const approvedRequests = "api/v1/following/approval-requests";
  static const blockUser = 'api/users/block-user/{userId}';
  static const authOTP = 'api/v1/auth/otp';
  static const search = "api/v1/user/search";
  static const onboarding = "api/v1/onboarding/ecom";
  static const updatePDoneProfile = "api/v1/p-done/profile";
  static const updateNonePDoneProfile = "api/v1/p-done/non-p-done-profile";
  static const listFriends = "/api/v1/following/friend";
  static const listFollowees = "/api/v1/following/followees";
  static const invite = "api/v1/team/{id}/invite";
  static const email = "api/v1/user/email";
  static const genEmail = "api/v1/user/add-email-otp";
  static const updateAvatar = "api/v1/user";
  static const setConfig = "api/v1/setting/personal/{key}";
  static const stringeeToken = "api/v1/call/stringee-token";
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

  @GET(UserApiConstants.followUserById)
  Future<GetUserFollowDetailResponse> getFollowUser(
    @Path('userId') int userId,
  );

  @POST(UserApiConstants.followUser)
  Future<FollowUserResponse> followUser({
    @Body() required FollowUserPayload body,
  });

  @POST(UserApiConstants.unFollow)
  Future unFollow({
    @Body() required UnFollowPayload body,
  });

  @GET(UserApiConstants.approvedRequests)
  Future<ApprovedRequestResponse> approvedRequest();

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

  @GET(UserApiConstants.listFollowees)
  Future<ListFolloweesResponse> listFollowees();

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

  @GET(UserApiConstants.stringeeToken)
  Future getStringeeToken();
}
