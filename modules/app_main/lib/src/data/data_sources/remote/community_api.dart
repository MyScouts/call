import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/networking/data_rows_response.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:app_main/src/data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';
import 'package:app_main/src/data/models/responses/member_join_request.dart';
import 'package:app_main/src/data/models/responses/my_team_response.dart';
import 'package:app_main/src/data/models/responses/team_member_response.dart';
import 'package:app_main/src/data/models/responses/team_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/payloads/community/update_community_payload.dart';
import '../../models/responses/api_response.dart';
import '../../models/responses/boss_community_status_response.dart';
import '../../models/responses/boss_team_relinquish_status_response.dart';
import '../../models/responses/confirm_response.dart';
import '../../models/responses/group_response.dart';
import '../../models/responses/leave_team_status_response.dart';

part 'community_api.g.dart';

class CommunityApiConstants {
  static const String getGroups = 'api/v1/group';
  static const String getGroupById = 'api/v1/group/{id}';
  static const String getTeams = 'api/group/{id}/team';
  static const String getTeamById = 'api/v1/team/{id}';
  static const String getMembers = '/api/v1/team/{id}/members';
  static const String getTeamList = 'api/v1/team/list';

  /// get Team & Group By BossId
  static const String getGroupDetail = 'api/group/boss-team/{id}';
  static const String updateGroup = '/api/v1/group/{id}';
  static const String updateTeam = 'api/team/{id}';
  static const String checkBossTeamId = 'api/team/check-team?bossTeamId={id}';
  static const String getFanGroup = 'api/fan-groups';
  static const String getFanGroupById = 'api/fan-groups/{id}';
  static const String joinFanGroup = 'api/fan-groups/{id}/join';
  static const String getMembersOfFanGroup =
      'api/fan-groups/{id}/members?types[]={type}';
  static const String editFanGroup = 'api/fan-groups/{id}';

  static const String getBossGroupStatus = '/api/v1/group/{id}/boss-status';
  static const String relinquishBossGroup =
      '/api/v1/group/{id}/give-up-boss-role';
  static const String getGroupRequests =
      '/api/v1/team/give-up-boss-role-request';
  static const String replyGiveUpBossTeamRole =
      '/api/v1/team/{id}/reply-give-up-boss-role';
  static const String askToJoinTeam = '/api/v1/team/{id}/join';
  static const String askToLeaveTeam = '/api/v1/team/{id}/leave';
  static const String getLeaveTeamStatus = '/api/v1/team/leave-requests';
  static const String memberJoinRequest = 'api/v1/team/member-join-requests';
  static const String memberLeaveRequest = 'api/v1/team/member-leave-requests';
  static const String replyJoinRequest =
      'api/v1/team/{teamId}/reply-join-request';
  static const String replyLeaveRequest =
      'api/v1/team/{teamId}/reply-leave-request';
  static const String assignBoss = 'api/v1/team/{teamId}/assign-boss';
  static const String revokeBoss = 'api/v1/team/{teamId}/revoke-boss';
  static const String relinquishBossTeam =
      '/api/v1/team/{id}/give-up-boss-role';
  static const String getBossTeamRelinquishStatus =
      '/api/v1/team/{id}/boss-status';
  static const String kickMember = '/api/v1/team/{teamId}/member/{userId}';
  static const String myTeam = 'api/v1/team/me';
}

@RestApi()
@injectable
abstract class CommunityApi {
  @factoryMethod
  factory CommunityApi(Dio dio) = _CommunityApi;

  @GET(CommunityApiConstants.getGroups)
  Future<GroupResponse> getGroups();

  @GET(CommunityApiConstants.getGroupById)
  Future<GroupByIdResponse> getGroupById(@Path('id') String id);

  @GET(CommunityApiConstants.getTeams)
  Future<ApiResponse<List<Team>>> getTeams({
    @Path('id') required String id,
  });

  @GET(CommunityApiConstants.getTeamById)
  Future<TeamByIdResponse> getTeamById(@Path('id') String id);

  @GET(CommunityApiConstants.getMembers)
  Future<TeamMemberResponse> getMembers({
    @Path('id') required String id,
  });

  @GET(CommunityApiConstants.getGroupDetail)
  Future<ApiResponse<GroupDetail>> getGroupDetail({
    @Path('id') required String id,
  });

  @GET(CommunityApiConstants.checkBossTeamId)
  Future<ApiResponse<dynamic>> checkBossTeamId({
    @Path('id') required String id,
  });

  @PATCH(CommunityApiConstants.updateGroup)
  Future<GroupByIdResponse> updateGroup({
    @Path('id') required String id,
    @Body() required UpdateCommunityPayload payload,
  });

  @GET(CommunityApiConstants.getTeamList)
  Future<TeamResponse> getTeamList({
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
    @Query('groupId') String? groupId,
    @Query('bossId') String? bossId,
  });

  @PUT(CommunityApiConstants.updateTeam)
  Future<ApiResponse<Team>> updateTeam({
    @Path('id') required String id,
    @Body() required UpdateCommunityPayload payload,
  });

  @GET(CommunityApiConstants.getFanGroup)
  Future<ApiResponse<FanGroup>> getFanGroup();

  @GET(CommunityApiConstants.getFanGroupById)
  Future<ApiResponse<FanGroup>> getFanGroupById({
    @Path('id') required int id,
  });

  @GET(CommunityApiConstants.getMembersOfFanGroup)
  Future<ApiResponse<DataRowsResponse<List<User>>>> getMembersOfFanGroup({
    @Path('id') required int id,
    @Path('type') required int type,
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
  });

  @POST(CommunityApiConstants.joinFanGroup)
  Future<ApiResponse<dynamic>> joinFanGroup({
    @Path('id') required int id,
  });

  @PUT(CommunityApiConstants.editFanGroup)
  Future<ApiResponse<dynamic>> editFanGroup({
    @Path('id') required int id,
    @Body() required UpdateCommunityPayload payload,
  });

  @POST(CommunityApiConstants.getBossGroupStatus)
  Future<BossCommunityStatusResponse> getBossGroupStatus({
    @Path('id') required String id,
  });

  @POST(CommunityApiConstants.relinquishBossGroup)
  Future<ConfirmResponse> relinquishBossGroup({
    @Path('id') required String id,
  });

  @GET(CommunityApiConstants.getGroupRequests)
  Future<GroupRequestResponse> getGroupRequests();

  @POST(CommunityApiConstants.replyGiveUpBossTeamRole)
  Future<ConfirmResponse> replyGiveUpBossTeamRole({
    @Path('id') required String id,
    @Body() required ReplyGiveUpBossTeamRolePayload payload,
  });

  @POST(CommunityApiConstants.askToJoinTeam)
  Future<ConfirmResponse> askToJoinTeam({
    @Path('id') required String id,
  });

  @DELETE(CommunityApiConstants.askToLeaveTeam)
  Future<ConfirmResponse> askToLeaveTeam({
    @Path('id') required String id,
  });

  @GET(CommunityApiConstants.getLeaveTeamStatus)
  Future<LeaveTeamStatusResponse> getLeaveTeamStatus();

  @GET(CommunityApiConstants.memberJoinRequest)
  Future<MemberJoinRequestResponse> memberJoinRequest(
    @Queries() GetCommunityPayload queries,
  );

  @GET(CommunityApiConstants.memberLeaveRequest)
  Future<MemberJoinRequestResponse> memberLeaverRequest(
    @Queries() GetCommunityPayload queries,
  );

  @POST(CommunityApiConstants.replyJoinRequest)
  Future replyJoinRequest(
    @Path() String teamId,
    @Body() dynamic body,
  );

  @POST(CommunityApiConstants.replyLeaveRequest)
  Future replyLeaveRequest(
    @Path() String teamId,
    @Body() dynamic body,
  );

  @POST(CommunityApiConstants.assignBoss)
  Future assignBoss(
    @Path() String teamId,
    @Body() dynamic body,
  );

  @POST(CommunityApiConstants.revokeBoss)
  Future revokeBoss(@Path() String teamId);
  @POST(CommunityApiConstants.relinquishBossTeam)
  Future<ConfirmResponse> relinquishBossTeam({
    @Path('id') required String id,
  });

  @GET(CommunityApiConstants.getBossTeamRelinquishStatus)
  Future<BossTeamRelinquishStatusResponse> getBossTeamRelinquishStatus(
      @Path() String id);

  @DELETE(CommunityApiConstants.kickMember)
  Future kickMember(
    @Path('userId') int userId,
    @Path('teamId') String teamId,
  );

  @GET(CommunityApiConstants.myTeam)
  Future<MyTeamResponse> myTeams();
}
