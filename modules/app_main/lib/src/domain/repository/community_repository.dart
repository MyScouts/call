import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';

import '../../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import '../../data/models/payloads/community/update_community_payload.dart';
import '../../data/models/responses/boss_community_status_response.dart';
import '../../data/models/responses/confirm_response.dart';
import '../../data/models/responses/leave_team_status_response.dart';

abstract class CommunityRepository {
  Future<List<Group>> getGroups();

  Future<Group> getGroup(String id);

  Future<List<Team>> getTeamByGroupID(String id);

  Future<Team> getTeamById(String id);

  Future<List<User>> getMembers(String id);

  Future<GroupDetail> getGroupDetail(String id);

  Future<bool> checkBossTeamId(String id);

  Future<Group> updateGroup(String id, UpdateCommunityPayload payload);

  Future<Team> updateTeam(String id, UpdateCommunityPayload payload);

  Future<FanGroup> getFanGroup();

  Future<FanGroup> getFanGroupById(int id);

  Future<List<User>> getMembersOfFanGroup(
    int id,
    int type,
    int? page,
    int? pageSize,
  );

  Future<List<Team>> getTeamList({
    required int page,
    required int pageSize,
    String? groupId,
    String? bossId,
  });

  Future<bool> joinFanGroup(int id);

  Future<bool> updateFanGroup(int id, UpdateCommunityPayload payload);

  Future<BossCommunityStatusResponse> getBossGroupStatus(String id);

  Future<ConfirmResponse> relinquishBossGroup(String id);

  Future<List<GroupRequest>> getGroupRequests();

  Future<ConfirmResponse> replyGiveUpBossTeamRole(
      String id, ReplyGiveUpBossTeamRolePayload payload);

  Future<ConfirmResponse> askToJoinTeam(String id);

  Future<ConfirmResponse> askToLeaveTeam(String id);

  Future<LeaveTeamStatusResponse> getLeaveTeamStatus();
}
