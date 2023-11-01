import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/community/update_community_payload.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:injectable/injectable.dart';

import '../repository/community_repository.dart';


@injectable
class CommunityUsecase {
  final CommunityRepository _communityRepository;
  final ResourceUsecase _resourceUsecase;

  CommunityUsecase(this._communityRepository, this._resourceUsecase);

  Future<List<Group>> getGroups() {
    return _communityRepository.getGroups();
  }

  Future<Group> getGroupDetail(int id) => _communityRepository.getGroup(id);

  Future<List<Team>> getTeamByGroupID(int id) {
    return _communityRepository.getTeamByGroupID(id);
  }

  Future<Team> getTeamById(int id) => _communityRepository.getTeamById(id);

  Future<List<Member>> getMembers(int id) {
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

  Future<Group> updateGroup(int id, UpdateCommunityPayload payload) async {
    return _communityRepository.updateGroup(id, payload);
  }

  Future<Team> updateTeam(int id, UpdateCommunityPayload payload) async {
    return _communityRepository.updateTeam(id, payload);
  }

  Future<String> uploadNewImage(String image) async {
    // BE return new url avatar
    return _resourceUsecase.uploadImage(File(image));
  }

  Future<FanGroup> getFanGroup() => _communityRepository.getFanGroup();

  Future<FanGroup> getFanGroupById(int id) =>
      _communityRepository.getFanGroupById(id);

  Future<List<Member>> getMembersOfFanGroup(int id, int type,
      {int? page, int? pageSize}) {
    return _communityRepository.getMembersOfFanGroup(id, type, page, pageSize);
  }

  Future<bool> joinFanGroup(int id) {
    return _communityRepository.joinFanGroup(id);
  }

  Future<bool> updateFanGroup(int id, UpdateCommunityPayload payload) async {
    return _communityRepository.updateFanGroup(id, payload);
  }
}
