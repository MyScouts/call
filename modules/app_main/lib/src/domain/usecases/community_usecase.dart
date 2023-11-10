import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:app_main/src/data/models/responses/boss_team_relinquish_status_response.dart';
import 'package:app_main/src/data/models/responses/member_join_request.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import '../../data/models/payloads/community/update_community_payload.dart';
import '../../data/models/responses/boss_community_status_response.dart';
import '../../data/models/responses/confirm_response.dart';
import '../../data/models/responses/group_request_response.dart';
import '../../data/models/responses/leave_team_status_response.dart';
import '../../presentation/community/community_constants.dart';
import '../repository/community_repository.dart';

@injectable
class CommunityUsecase {
  final CommunityRepository _communityRepository;
  final ResourceUsecase _resourceUsecase;

  CommunityUsecase(this._communityRepository, this._resourceUsecase);

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

  Future<String> uploadNewImage(String image) async {
    // BE return new url avatar
    return _resourceUsecase.uploadImage(File(image));
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

  Future<BossTeamRelinquishStatusResponse> getBossTeamRelinquishStatus(String id) async {
    return await _communityRepository.getBossTeamRelinquishStatus(id);
  }

  Future<List<GroupRequest>> getGroupRequests() async {
    return await _communityRepository.getGroupRequests();
  }

  Future<ConfirmResponse> replyGiveUpBossTeamRole(
      String id, ReplyGiveUpBossTeamRolePayload payload) async {
    return await _communityRepository.replyGiveUpBossTeamRole(id, payload);
  }

  Future<ConfirmResponse> askToJoinTeam(String id) async {
    return await _communityRepository.askToJoinTeam(id);
  }

  Future<ConfirmResponse> askToLeaveTeam(String id) async {
    return await _communityRepository.askToLeaveTeam(id);
  }

  Future<LeaveTeamStatusResponse> getLeaveTeamStatus() async {
    return await _communityRepository.getLeaveTeamStatus();
  }

  Future<MemberJoinRequestResponse> memberJoinRequest() {
    return _communityRepository.memberJoinRequest();
  }

  Future<MemberJoinRequestResponse> memberLeaveRequest() {
    return _communityRepository.memberLeaveRequest();
  }

  Future replyJoinRequest(String teamId, ReplyJoinRequestPayload payload) {
    return _communityRepository.replyJoinRequest(teamId, payload);
  }

  Future replyLeaveRequest(String teamId, ReplyJoinRequestPayload payload) {
    return _communityRepository.replyLeaveRequest(teamId, payload);
  }
}
