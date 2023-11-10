import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/community_usecase.dart';
import 'groups/group_listing_bloc.dart';

@module
abstract class CommunityModule {
  @factory
  GetListGroupsBloc createGetListGroupsBloc(CommunityUsecase usecase) =>
      GetListGroupsBloc(usecase.getGroups);

  @factory
  GetListTeamsBloc createGetListTeamsBloc(CommunityUsecase usecase) =>
      GetListTeamsBloc(usecase.getTeamByGroupID);

  @factory
  GetFanGroupBloc createGetFanGroupBloc(CommunityUsecase usecase) =>
      GetFanGroupBloc(usecase.getFanGroup);

  @factory
  GetBossStatusBloc createGetBossStatusBloc(CommunityUsecase usecase) =>
      GetBossStatusBloc(usecase.getBossGroupStatus);

  @factory
  RelinquishBossRoleBloc createRelinquishBossRoleBloc(
          CommunityUsecase usecase) =>
      RelinquishBossRoleBloc(usecase.relinquishBossRole);

  @factory
  GetGroupRequestsBloc createGetGroupRequestsBloc(CommunityUsecase usecase) =>
      GetGroupRequestsBloc(usecase.getGroupRequests);

  @factory
  ReplyGiveUpBossTeamBloc createReplyGiveUpBossTeamBloc(
          CommunityUsecase usecase) =>
      ReplyGiveUpBossTeamBloc(usecase.replyGiveUpBossTeamRole);

  @factory
  GetBossTeamRelinquishStatusBloc createGetBossTeamRelinquishStatusBloc(
          CommunityUsecase usecase) =>
      GetBossTeamRelinquishStatusBloc(usecase.getBossTeamRelinquishStatus);
}
