import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/community/update_community_payload.dart';

abstract class CommunityRepository {
  Future<List<Group>> getGroups();

  Future<Group> getGroup(String id);

  Future<List<Team>> getTeamByGroupID(String id);

  Future<Team> getTeamById(String id);

  Future<List<Member>> getMembers(String id);

  Future<GroupDetail> getGroupDetail(String id);

  Future<bool> checkBossTeamId(String id);

  Future<Group> updateGroup(String id, UpdateCommunityPayload payload);

  Future<Team> updateTeam(String id, UpdateCommunityPayload payload);

  Future<FanGroup> getFanGroup();

  Future<FanGroup> getFanGroupById(int id);

  Future<List<Member>> getMembersOfFanGroup(
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
}
