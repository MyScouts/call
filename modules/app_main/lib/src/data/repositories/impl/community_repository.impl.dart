import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import 'package:app_main/src/data/models/responses/boss_community_status_response.dart';
import 'package:app_main/src/data/models/responses/confirm_response.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';
import 'package:app_main/src/data/models/responses/leave_team_status_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/community_repository.dart';
import '../../data_sources/remote/community_api.dart';
import '../../models/payloads/community/update_community_payload.dart';

@Injectable(as: CommunityRepository)
class CommunityRepositoryImpl extends CommunityRepository {
  final CommunityApi _communityApi;

  CommunityRepositoryImpl(this._communityApi);

  @override
  Future<List<Group>> getGroups() async {
    final res = await _communityApi.getGroups();

    return res.groups;
  }

  @override
  Future<List<Team>> getTeamByGroupID(String id) async {
    final res = await _communityApi.getTeams(id: id);

    return res.data;
  }

  @override
  Future<Group> getGroup(String id) async {
    final res = await _communityApi.getGroupById(id);

    return res.group;
  }

  @override
  Future<Team> getTeamById(String id) async {
    final res = await _communityApi.getTeamById(id);

    return res.team;
  }

  @override
  Future<List<User>> getMembers(String id) async {
    final res = await _communityApi.getMembers(id: id);

    return res.members ?? [];
  }

  @override
  Future<GroupDetail> getGroupDetail(String id) async {
    final res = await _communityApi.getGroupDetail(id: id);

    return res.data;
  }

  @override
  Future<bool> checkBossTeamId(String id) async {
    final res = await _communityApi.checkBossTeamId(id: id);

    return res.success;
  }

  @override
  Future<Group> updateGroup(String id, UpdateCommunityPayload payload) async {
    final res = await _communityApi.updateGroup(id: id, payload: payload);
    return res.group;
  }

  @override
  Future<Team> updateTeam(String id, UpdateCommunityPayload payload) async {
    final res = await _communityApi.updateTeam(id: id, payload: payload);
    return res.data;
  }

  @override
  Future<FanGroup> getFanGroup() async {
    final res = await _communityApi.getFanGroup();
    return res.data;
  }

  @override
  Future<FanGroup> getFanGroupById(int id) async {
    final res = await _communityApi.getFanGroupById(id: id);
    return res.data;
  }

  @override
  Future<List<User>> getMembersOfFanGroup(
    int id,
    int type,
    int? page,
    int? pageSize,
  ) async {
    final res = await _communityApi.getMembersOfFanGroup(
      id: id,
      type: type,
      page: page,
      pageSize: pageSize,
    );

    return res.data.rows;
  }

  @override
  Future<bool> joinFanGroup(int id) async {
    final res = await _communityApi.joinFanGroup(id: id);
    return res.success;
  }

  // @override
  // Future<List<Member>> getMembersOfFanGroup(int id, int type, int? page, int? pageSize) {
  //   // TODO: implement getMembersOfFanGroup
  //   throw UnimplementedError();
  // }

  @override
  Future<bool> updateFanGroup(int id, UpdateCommunityPayload payload) async {
    final res = await _communityApi.editFanGroup(id: id, payload: payload);
    return res.success;
  }

  @override
  Future<List<Team>> getTeamList({
    required int page,
    required int pageSize,
    String? groupId,
    String? bossId,
  }) async {
    final res = await _communityApi.getTeamList(
      page: page,
      pageSize: pageSize,
      groupId: groupId,
      bossId: bossId,
    );
    return res.teams;
  }

  @override
  Future<BossCommunityStatusResponse> getBossGroupStatus(String id) async {
    return await _communityApi.getBossGroupStatus(id: id);
  }

  @override
  Future<ConfirmResponse> relinquishBossGroup(String id) async {
    return await _communityApi.relinquishBossGroup(id: id);
  }

  @override
  Future<List<GroupRequest>> getGroupRequests() async {
    final result = await _communityApi.getGroupRequests();
    return result.requests ?? [];
  }

  @override
  Future<ConfirmResponse> replyGiveUpBossTeamRole(
      String id, ReplyGiveUpBossTeamRolePayload payload) async {
    return await _communityApi.replyGiveUpBossTeamRole(
        id: id, payload: payload);
  }

  @override
  Future<ConfirmResponse> askToJoinTeam(String id) async {
    return await _communityApi.askToJoinTeam(id: id);
  }

  @override
  Future<ConfirmResponse> askToLeaveTeam(String id) async {
    return await _communityApi.askToLeaveTeam(id: id);
  }

  @override
  Future<LeaveTeamStatusResponse> getLeaveTeamStatus() async {
    return await _communityApi.getLeaveTeamStatus();
  }
}
