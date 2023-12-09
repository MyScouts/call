import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/data/model/response/live_list_member_response.dart';
import 'package:app_main/src/presentation/live/data/model/response/live_stream_category_response.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_response.dart';
import '../../../domain/entities/gift_card_list.dart';
import '../../model/request/invite_friend_req.dart';
import '../../model/response/data_get_invite_friend.dart';
import '../../model/response/gift_card_live.dart';
import '../../model/response/join_live_response.dart';
import '../../model/response/live.dart';
import '../../model/response/member_count_data.dart';
import '../../model/response/user_point_response.dart';

part 'live_api.g.dart';

class LiveApiConstant {
  static const String createNewLive = 'api/live';
  static const String joinLive = 'api/live/{id}/join';
  static const String moderatorInvite = 'api/live/{id}/moderator';
  static const String moderatorConfirm = '/api/live/{id}/become-moderator';
  static const String liveTop = '/api/top-live/{liveId}/enqueue';
  static const String getListLive = 'api/live/list';
  static const String supervisor = 'api/live-supervisor/me';
  static const String memberCount = 'api/live/member-count';
  static const String getAllCateGory = 'api/category';
  static const String livePathId = '/api/live/{id}';
  static const String getListLiveMember = 'api/live/{id}/members';
  static const String kickMember = '/api/live/{id}/kick';
  static const String banMember = '/api/live/{id}/ban';
  static const String getListLivefollowing =
      'api/live/following?page={page}&pageSize={pageSize}';
  static const String getListTopLive = 'api/top-live/list';

  static const String rbContest = '/api/rb-contest/active';

  static const String giftCard = '/api/gift-card/live/{liveId}';

  static const String dailyDedications = '/api/gift-card/daily-dedication';

  static const String getDedications = '/api/gift-card/dedication';

  static const String festivalsInfo = '/api/festivals';

  static const String festivalsID = '/api/festivals/register-festival/{userId}';

  static const String voteForUser =
      '/api/gift-card/user/{userId}/report?contestId={contestId}';

  static const String defaultConfig = '/api/live/default-config';

  static const String giftCardList = 'api/gift-card/list';

  static const String sendGift = 'api/gift-card/give-gift';

  static const String userPoint = 'api/point/info';

  static const String getListInviteFriend = '/api/users/list-friends';

  static const String inviteFriend = '/api/live/{id}/invite';

  static const String joinable = '/api/live/{id}/joinable';

  static const String pkCreate = '/api/live-pk/invite';

  static const String pkAccept = '/api/live-pk/accept';
}

@RestApi()
@injectable
abstract class LiveApi {
  @factoryMethod
  factory LiveApi(Dio dio) = _LiveApi;

  @GET(LiveApiConstant.getListLive)
  Future<ApiResponse<Live>> getListLive({
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
    @Query('types') required List<String> types,
    @Query('categoryIds') List<int>? categoryId,
  });

  @POST(LiveApiConstant.joinLive)
  Future<ApiResponse<JoinLiveResponse>> joinLive({
    @Path('id') required int id,
    @Field() String? password,
  });

  @GET(LiveApiConstant.getListLiveMember)
  Future<ApiResponse<LiveListMemberResponse>> getListMemberLive({
    @Path('id') required int id,
  });

  @GET(LiveApiConstant.giftCardList)
  Future<ApiResponse<GiftCardList>> getGiftCardList(@Query('type') int type);

  @GET(LiveApiConstant.userPoint)
  Future<ApiResponse<UserPointResponse>> getUserPoint();

  @POST(LiveApiConstant.sendGift)
  Future sendGift(
    @Field('userId') int userId,
    @Field('liveId') int liveId,
    @Field('giftId') int giftId,
    @Field('total') int total,
  );

  @GET(LiveApiConstant.giftCard)
  Future<ApiResponse<GiftCardLive>> getInfoGiftCard(
      {@Path('liveId') required int liveId});

  @GET(LiveApiConstant.dailyDedications)
  Future<ApiResponse<GiftCardLive>> getDailyDedications({@Query('userId') required int userId});

  @GET(LiveApiConstant.getDedications)
  Future<ApiResponse<GiftCardLive>> getDedications({@Query('userId') required int userId});

  @POST(LiveApiConstant.createNewLive)
  Future<ApiResponse<LiveData>> createNewLive(
    @Body() Map<String, dynamic> json,
  );

  @DELETE(LiveApiConstant.livePathId)
  Future<ApiResponse<bool>> endLive({@Path('id') required int liveId});

  @GET(LiveApiConstant.getListInviteFriend)
  Future<ApiResponse<DataGetInviteFriend>> getListInviteFriend({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('isFriend') required bool isFriend,
  });

  @POST(LiveApiConstant.inviteFriend)
  Future<ApiResponse<dynamic>> inviteFriend(
      {@Path('id') required String liveId,
      @Body() required InviteFriendReq user});

  @GET(LiveApiConstant.memberCount)
  Future<ApiResponse<MemberCountData>> memberCount(
      {@Query('liveIds') required List<int> liveIds});

  @GET(LiveApiConstant.getAllCateGory)
  Future<ApiResponse<LiveStreamCategoryResponse>> getAllCateGory();

  @GET(LiveApiConstant.getListLivefollowing)
  Future<ApiResponse<Live>> getListLivefollowing({
    @Path('page') required int page,
    @Path('pageSize') required int pageSize,
    @Path('isFriend') required bool isFriend,
  });

  @POST(LiveApiConstant.joinable)
  Future<Object> checkPass(
    @Path('id') int liveId,
    @Field('password') String password,
  );

  @POST(LiveApiConstant.pkCreate)
  Future<Object> invitePK(@Body() Map<String, dynamic> json);

  @POST(LiveApiConstant.pkAccept)
  Future<Object> acceptPK(@Body() Map<String, dynamic> json);

//
// @POST(LiveApiConstant.joinLive)
// Future<ApiResponse<LiveResponse>> joinLive({
//   @Path('id') required int id,
//   @Field() String? password,
//   @Field() required bool ignoreSupervisor,
// });
//
// @POST(LiveApiConstant.liveTop)
// Future<ApiResponse> liveTopQueue({@Path('liveId') required String liveId});
//
// @GET(LiveApiConstant.memberCount)
// Future<ApiResponse<MemberCountData>> memberCount(
//     {@Query('liveIds') required List<int> liveIds});
//
// @POST(LiveApiConstant.kickMember)
// Future<ApiResponse> kickMember(
//     {@Path('id') required String liveId,
//       @Field('userIds') required List<int> users});
//
// @POST(LiveApiConstant.banMember)
// Future<ApiResponse> banMember(
//     {@Path('id') required String liveId,
//       @Field('userIds') required List<int> users});
//
// @POST(LiveApiConstant.moderatorInvite)
// Future<ApiResponse> moderatorInvite({
//   @Path('id') required int id,
//   @Field() required int userId,
// });
//
// @DELETE(LiveApiConstant.moderatorInvite)
// Future<ApiResponse> moderatorDelete({
//   @Path('id') required int id,
//   @Field() required int userId,
// });
//
// @POST(LiveApiConstant.moderatorConfirm)
// Future<ApiResponse> confirmModerator({@Path('id') required int id});
//
// @GET(LiveApiConstant.supervisor)
// Future<ApiResponse<SupervisorOfMe>> supervisorOfMe();
//
//
//
// @PATCH(LiveApiConstant.livePathId)
// Future<ApiResponse<bool>> updateLive(
//     {@Path('id') required int liveId,
//       @Body() required UpdateLiveInfoPayload body});
//
// @GET(LiveApiConstant.getListLiveMember)
// Future<ApiResponse<LiveListMemberResponse>> getListMemberLive(
//     {@Path('id') required int id});
//
// @GET(LiveApiConstant.getListLivefollowing)
// Future<ApiResponse<Live>> getListLivefollowing({
//   @Path('page') required int page,
//   @Path('pageSize') required int pageSize,
//   @Path('isFriend') required bool isFriend,
// });
//
// @DELETE(LiveApiConstant.livePathId)
// Future<ApiResponse<bool>> endLive({@Path('id') required int liveId});
//
// @GET(LiveApiConstant.getListTopLive)
// Future<ApiResponse<Live>> getListTopLive();
//
// @GET(LiveApiConstant.rbContest)
// Future<ApiResponse<ContestData>> getRBContest();
//
// @GET(LiveApiConstant.giftCard)
// Future<ApiResponse<GiftCardLive>> getInfoGiftCard(
//     {@Path('liveId') required int liveId});
//
// @GET(LiveApiConstant.festivalsInfo)
// Future<ApiResponse<Festival>> getFestivalsInfo();
//
// @GET(LiveApiConstant.festivalsID)
// Future<ApiResponse> getFestivalsID({@Path('userId') required int userId});
//
// @GET(LiveApiConstant.voteForUser)
// Future<ApiResponse<VoteInfo?>> getVoteForUser(
//     {@Path('userId') required int userId,
//       @Path('contestId') required int contestId});
//
// @GET(LiveApiConstant.defaultConfig)
// Future<ApiResponse<LiveConfig?>> getLiveConfig();
}
