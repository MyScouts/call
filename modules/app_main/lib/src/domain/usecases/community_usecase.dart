import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:app_main/src/data/models/responses/ask_join_team_response.dart';
import 'package:app_main/src/data/models/responses/boss_team_relinquish_status_response.dart';
import 'package:app_main/src/data/models/responses/join_request_response.dart';
import 'package:app_main/src/data/models/responses/member_join_request.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import '../../data/models/payloads/community/update_community_payload.dart';
import '../../data/models/responses/boss_community_status_response.dart';
import '../../data/models/responses/confirm_response.dart';
import '../../data/models/responses/group_request_response.dart';
import '../../data/models/responses/leave_team_status_response.dart';
import '../../data/models/responses/open_group_request_response.dart';
import '../../presentation/community/community_constants.dart';
import '../repository/community_repository.dart';

@injectable
class CommunityUsecase {
  final CommunityRepository _communityRepository;

  CommunityUsecase(this._communityRepository);

  Future<List<Group>> getGroups() {
    return _communityRepository.getGroups();
  }

  Future<Group> getGroupDetail(String id) => _communityRepository.getGroup(id);

  Future<List<Team>> getTeamByGroupID(String id) {
    return _communityRepository.getTeamByGroupID(id);
  }

  Future<Team> getTeamById(String id) => _communityRepository.getTeamById(id);

  Future<List<User>> getMembers(String id) {
    return _communityRepository.getMembers(id);
  }

  Future<GroupDetail> getGroupDetailByBossID(String id) {
    return _communityRepository.getGroupDetail(id);
  }

  Future<bool> checkBossTeamId(String id) async {
    try {
      return _communityRepository.checkBossTeamId(id);
    } catch (e) {
      return false;
    }
  }

  Future<Group> updateGroup(String id, UpdateCommunityPayload payload) async {
    return _communityRepository.updateGroup(id, payload);
  }

  Future<Team> updateTeam(String id, UpdateCommunityPayload payload) async {
    return _communityRepository.updateTeam(id, payload);
  }

  Future<FanGroup> getFanGroup() => _communityRepository.getFanGroup();

  Future<FanGroup> getFanGroupById(int id) =>
      _communityRepository.getFanGroupById(id);

  Future<List<User>> getMembersOfFanGroup(int id, int type,
      {int? page, int? pageSize}) {
    return _communityRepository.getMembersOfFanGroup(id, type, page, pageSize);
  }

  Future<bool> joinFanGroup(int id) {
    return _communityRepository.joinFanGroup(id);
  }

  Future<bool> updateFanGroup(int id, UpdateCommunityPayload payload) async {
    return _communityRepository.updateFanGroup(id, payload);
  }

  Future<List<Team>> getTeamList({
    required int page,
    required int pageSize,
    String? groupId,
    String? bossId,
  }) async {
    return _communityRepository.getTeamList(
      pageSize: pageSize,
      page: page,
      groupId: groupId,
      bossId: bossId,
    );
  }

  Future<BossCommunityStatusResponse> getBossGroupStatus(String id) async {
    final result = await _communityRepository.getBossGroupStatus(id);

    return result;
  }

  Future<ConfirmResponse> relinquishBossRole(
      String id, CommunityType type) async {
    if (type == CommunityType.group) {
      return await _communityRepository.relinquishBossGroup(id);
    } else {
      return await _communityRepository.relinquishBossTeam(id);
    }
  }

  Future<BossTeamRelinquishStatusResponse> getBossTeamRelinquishStatus(
      String id) async {
    return await _communityRepository.getBossTeamRelinquishStatus(id);
  }

  Future<List<GroupRequest>> getGroupRequests() async {
    return await _communityRepository.getGroupRequests();
  }

  Future<ConfirmResponse> replyGiveUpBossTeamRole(
      String id, ReplyGiveUpBossTeamRolePayload payload) async {
    return await _communityRepository.replyGiveUpBossTeamRole(id, payload);
  }

  Future<AskJoinTeamResponse> askToJoinTeam(String id) async {
    return await _communityRepository.askToJoinTeam(id);
  }

  Future<ConfirmResponse> askToLeaveTeam(String id) async {
    return await _communityRepository.askToLeaveTeam(id);
  }

  Future<LeaveTeamStatusResponse> getLeaveTeamStatus() async {
    return await _communityRepository.getLeaveTeamStatus();
  }

  Future<MemberJoinRequestResponse> memberJoinRequest(
      GetCommunityPayload query) {
    return _communityRepository.memberJoinRequest(query);
  }

  Future<MemberJoinRequestResponse> memberLeaveRequest(
      GetCommunityPayload query) {
    return _communityRepository.memberLeaveRequest(query);
  }

  Future replyJoinRequest(String teamId, ReplyJoinRequestPayload payload) {
    return _communityRepository.replyJoinRequest(teamId, payload);
  }

  Future replyLeaveRequest(String teamId, ReplyJoinRequestPayload payload) {
    return _communityRepository.replyLeaveRequest(teamId, payload);
  }

  Future assignBoss(String teamId, AssignBossPayload payload) {
    return _communityRepository.assignBoss(teamId, payload);
  }

  Future revokeBoss(String teamId) {
    return _communityRepository.revokeBoss(teamId);
  }

  Future kickMember(int userId, String teamId) {
    return _communityRepository.kickMember(userId, teamId);
  }

  Future<List<Team>> myTeams() async {
    final response = await _communityRepository.myTeams();
    return response.teams ?? [];
  }

  Future<List<Group>> myGroups() async {
    final response = await _communityRepository.myGroups();
    return response.groups ?? [];
  }

  Future<OpenGroupRequestResponse> getOpenGroupRequest() async {
    final response = await _communityRepository.getOpenGroupRequest();
    return response;
  }

  Future<ConfirmResponse> deleteOpenGroupRequest() async {
    final response = await _communityRepository.deleteOpenGroupRequest();
    return response;
  }

  Future<dynamic> createOpenGroupRequest(String otp) async {
    final response = await _communityRepository.createOpenGroupRequest(otp);
    return response;
  }

  Future getOtp() async {
    final response = await _communityRepository.getOtp();
    return response;
  }

  Future<List<JoinRequest>> joinRequests() async {
    final response = await _communityRepository.joinRequests();
    return response.requests;
  }

  Future deleteJoinRequest(int requestId) {
    return _communityRepository.deleteJoinRequests(requestId);
  }
}
