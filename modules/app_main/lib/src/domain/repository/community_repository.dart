import 'package:app_core/app_core.dart';

abstract class CommunityRepository {
  Future<List<Group>> getGroups();

  Future<Group> getGroup(int id);

  Future<List<Team>> getTeamByGroupID(int id);

  Future<Team> getTeamById(int id);

  Future<List<Member>> getMembers(int id);

  Future<GroupDetail> getGroupDetail(String id);

  Future<bool> checkBossTeamId(String id);

  // Future<Group> updateGroup(int id, UpdateCommunityPayload payload);
  //
  // Future<Team> updateTeam(int id, UpdateCommunityPayload payload);

  Future<FanGroup> getFanGroup();

  Future<FanGroup> getFanGroupById(int id);

  Future<List<Member>> getMembersOfFanGroup(
    int id,
    int type,
    int? page,
    int? pageSize,
  );

  Future<bool> joinFanGroup(int id);

// Future<bool> updateFanGroup(int id, UpdateCommunityPayload payload);
}
