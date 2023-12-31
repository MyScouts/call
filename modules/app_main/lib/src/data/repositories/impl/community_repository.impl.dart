import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:app_main/src/data/models/payloads/community/otp_payload.dart';
import 'package:app_main/src/data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import 'package:app_main/src/data/models/responses/boss_community_status_response.dart';
import 'package:app_main/src/data/models/responses/boss_team_relinquish_status_response.dart';
import 'package:app_main/src/data/models/responses/confirm_response.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';
import 'package:app_main/src/data/models/responses/join_request_response.dart';
import 'package:app_main/src/data/models/responses/leave_team_status_response.dart';
import 'package:app_main/src/data/models/responses/member_join_request.dart';
import 'package:app_main/src/data/models/responses/my_group_response.dart';
import 'package:app_main/src/data/models/responses/my_team_response.dart';
import 'package:app_main/src/data/models/responses/open_group_request_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/community_repository.dart';
import '../../data_sources/remote/community_api.dart';
import '../../models/payloads/community/request_boss_group_payload.dart';
import '../../models/payloads/community/update_community_payload.dart';
import '../../models/responses/ask_join_team_response.dart';

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
    final res = await _communityApi.updateGroup(id, payload.toJson());
    return res.group;
  }

  @override
  Future<Team> updateTeam(String id, UpdateCommunityPayload payload) async {
    final res = await _communityApi.updateTeam(
      id: id,
      payload: payload.toJson(),
    );
    return res.team;
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
  Future<AskJoinTeamResponse> askToJoinTeam(String id) async {
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

  @override
  Future<MemberJoinRequestResponse> memberJoinRequest(
    GetCommunityPayload query,
  ) async {
    return await _communityApi.memberJoinRequest(
      query,
    );
  }

  @override
  Future replyJoinRequest(String teamId, ReplyJoinRequestPayload payload) {
    return _communityApi.replyJoinRequest(teamId, payload.toJson());
  }

  @override
  Future<MemberJoinRequestResponse> memberLeaveRequest(
      GetCommunityPayload query) {
    return _communityApi.memberLeaverRequest(query);
  }

  @override
  Future replyLeaveRequest(String teamId, ReplyJoinRequestPayload payload) {
    return _communityApi.replyLeaveRequest(teamId, payload.toJson());
  }

  @override
  Future kickMember(int userId, String teamId) {
    return _communityApi.kickMember(userId, teamId);
  }

  @override
  Future assignBoss(String teamId, AssignBossPayload payload) {
    return _communityApi.assignBoss(teamId, payload.toJson());
  }

  @override
  Future revokeBoss(String teamId) {
    return _communityApi.revokeBoss(teamId);
  }

  @override
  Future<ConfirmResponse> relinquishBossTeam(String id) async {
    return await _communityApi.relinquishBossTeam(id: id);
  }

  @override
  Future<BossTeamRelinquishStatusResponse> getBossTeamRelinquishStatus(
      String id) async {
    return await _communityApi.getBossTeamRelinquishStatus(id);
  }

  @override
  Future<MyTeamResponse> myTeams() {
    return _communityApi.myTeams();
  }

  @override
  Future<MyGroupResponse> myGroups() {
    return _communityApi.myGroups();
  }

  @override
  Future createOpenGroupRequest(String otp) {
    final payload = RequestBossGroupPayload(otp: otp);
    return _communityApi.createOpenGroupRequest(payload);
  }

  @override
  Future<ConfirmResponse> deleteOpenGroupRequest() {
    return _communityApi.deleteOpenGroupRequest();
  }

  @override
  Future<OpenGroupRequestResponse> getOpenGroupRequest() {
    return _communityApi.getOpenGroupRequest();
  }

  @override
  Future getOtp() {
    final payload = OtpPayload(type: 'RequestOpenGroup');
    return _communityApi.getOtp(payload);
  }

  @override
  Future<JoinRequestResponse> joinRequests() {
    return _communityApi.joinRequests();
  }

  @override
  Future deleteJoinRequests(int requestId) {
    return _communityApi.deleteJoinTeam(requestId);
  }
}
