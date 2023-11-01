import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/networking/data_rows_response.dart';
import 'package:app_main/src/domain/entities/community/update_community_payload.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/api_response.dart';

part 'community_api.g.dart';

class CommunityApiConstants {
  static const String getGroups = 'api/v1/group';
  static const String getGroup = 'api/group/{id}';
  static const String getTeams = 'api/group/{id}/team';
  static const String getTeamById = 'api/team/{id}';
  static const String getMembers = 'api/team/{id}/get-member';

  /// get Team & Group By BossId
  static const String getGroupDetail = 'api/group/boss-team/{id}';
  static const String updateGroup = 'api/group/{id}';
  static const String updateTeam = 'api/team/{id}';
  static const String checkBossTeamId = 'api/team/check-team?bossTeamId={id}';
  static const String getFanGroup = 'api/fan-groups';
  static const String getFanGroupById = 'api/fan-groups/{id}';
  static const String joinFanGroup = 'api/fan-groups/{id}/join';
  static const String getMembersOfFanGroup =
      'api/fan-groups/{id}/members?types[]={type}';
  static const String editFanGroup = 'api/fan-groups/{id}';
}

@RestApi()
@injectable
abstract class CommunityApi {
  @factoryMethod
  factory CommunityApi(Dio dio) = _CommunityApi;

  @GET(CommunityApiConstants.getGroups)
  Future<ApiResponse<List<Group>>> getGroups();

  @GET(CommunityApiConstants.getGroup)
  Future<ApiResponse<Group>> getGroup(@Path('id') int id);

  @GET(CommunityApiConstants.getTeams)
  Future<ApiResponse<List<Team>>> getTeams({
    @Path('id') required int id,
  });

  @GET(CommunityApiConstants.getTeamById)
  Future<ApiResponse<Team>> getTeamById(@Path('id') int id);

  @GET(CommunityApiConstants.getMembers)
  Future<ApiResponse<List<Member>>> getMembers({
    @Path('id') required int id,
  });

  @GET(CommunityApiConstants.getGroupDetail)
  Future<ApiResponse<GroupDetail>> getGroupDetail({
    @Path('id') required String id,
  });

  @GET(CommunityApiConstants.checkBossTeamId)
  Future<ApiResponse<dynamic>> checkBossTeamId({
    @Path('id') required String id,
  });

  @PUT(CommunityApiConstants.updateGroup)
  Future<ApiResponse<Group>> updateGroup({
    @Path('id') required int id,
    @Body() required UpdateCommunityPayload payload,
  });

  @PUT(CommunityApiConstants.updateTeam)
  Future<ApiResponse<Team>> updateTeam({
    @Path('id') required int id,
    @Body() required UpdateCommunityPayload payload,
  });

  @GET(CommunityApiConstants.getFanGroup)
  Future<ApiResponse<FanGroup>> getFanGroup();

  @GET(CommunityApiConstants.getFanGroupById)
  Future<ApiResponse<FanGroup>> getFanGroupById({
    @Path('id') required int id,
  });

  @GET(CommunityApiConstants.getMembersOfFanGroup)
  Future<ApiResponse<DataRowsResponse<List<Member>>>> getMembersOfFanGroup({
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
}
