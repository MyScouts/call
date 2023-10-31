import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/community_repository.dart';
import '../../data_sources/remote/community_api.dart';

@Injectable(as: CommunityRepository)
class CommunityRepositoryImpl extends CommunityRepository {
  final CommunityApi _communityApi;

  CommunityRepositoryImpl(this._communityApi);

  @override
  Future<List<Group>> getGroups() async {
    final res = await _communityApi.getGroups();

    return res.data;
  }

  @override
  Future<List<Team>> getTeamByGroupID(int id) async {
    final res = await _communityApi.getTeams(id: id);

    return res.data;
  }

  @override
  Future<Group> getGroup(int id) async {
    final res = await _communityApi.getGroup(id);

    return res.data;
  }

  @override
  Future<Team> getTeamById(int id) async {
    final res = await _communityApi.getTeamById(id);

    return res.data;
  }

  @override
  Future<List<Member>> getMembers(int id) async {
    final res = await _communityApi.getMembers(id: id);

    return res.data;
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
  Future<FanGroup> getFanGroup() {
    // TODO: implement getFanGroup
    throw UnimplementedError();
  }

  @override
  Future<FanGroup> getFanGroupById(int id) {
    // TODO: implement getFanGroupById
    throw UnimplementedError();
  }

  @override
  Future<List<Member>> getMembersOfFanGroup(int id, int type, int? page, int? pageSize) {
    // TODO: implement getMembersOfFanGroup
    throw UnimplementedError();
  }

  @override
  Future<bool> joinFanGroup(int id) {
    // TODO: implement joinFanGroup
    throw UnimplementedError();
  }

  // @override
  // Future<Group> updateGroup(int id, UpdateCommunityPayload payload) async {
  //   final res = await _communityApi.updateGroup(id: id, payload: payload);
  //   return res.data;
  // }
  //
  // @override
  // Future<Team> updateTeam(int id, UpdateCommunityPayload payload) async {
  //   final res = await _communityApi.updateTeam(id: id, payload: payload);
  //   return res.data;
  // }

  // @override
  // Future<FanGroup> getFanGroup() async {
  //   final res = await _communityApi.getFanGroup();
  //   return res.data;
  // }
  //
  // @override
  // Future<FanGroup> getFanGroupById(int id) async {
  //   final res = await _communityApi.getFanGroupById(id: id);
  //   return res.data;
  // }

  // @override
  // Future<List<Member>> getMembersOfFanGroup(
  //   int id,
  //   int type,
  //   int? page,
  //   int? pageSize,
  // ) async {
  //   final res = await _communityApi.getMembersOfFanGroup(
  //     id: id,
  //     type: type,
  //     page: page,
  //     pageSize: pageSize,
  //   );
  //
  //   return res.data.rows;
  // }

  // @override
  // Future<bool> joinFanGroup(int id) async {
  //   final res = await _communityApi.joinFanGroup(id: id);
  //   return res.success;
  // }
  //
  // @override
  // Future<List<Member>> getMembersOfFanGroup(int id, int type, int? page, int? pageSize) {
  //   // TODO: implement getMembersOfFanGroup
  //   throw UnimplementedError();
  // }

  // @override
  // Future<bool> updateFanGroup(int id, UpdateCommunityPayload payload) async {
  //   final res = await _communityApi.editFanGroup(id: id, payload: payload);
  //   return res.success;
  // }
}
