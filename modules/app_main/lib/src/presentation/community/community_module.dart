import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/community_usecase.dart';
import 'groups/group_listing_bloc.dart';

@module
abstract class CommunityModule {
  @factory
  GetMyGroupsBloc createGetMyGroupsBloc(CommunityUsecase usecase) =>
      GetMyGroupsBloc(usecase.myGroups);

  @factory
  GetOpenGroupRequestBloc createGetOpenGroupRequestBloc(
          CommunityUsecase usecase) =>
      GetOpenGroupRequestBloc(usecase.getOpenGroupRequest);

  @factory
  GetListTeamsBloc createGetListTeamsBloc(CommunityUsecase usecase) =>
      GetListTeamsBloc(usecase.getTeamByGroupID);

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

  // @factory
  // GetOTPBloc createGetOTPBloc(CommunityUsecase usecase) =>
  //     GetOTPBloc(usecase.getOtp);

  @factory
  DeleteOpenGroupRequestBloc createDeleteOpenGroupRequestBloc(
          CommunityUsecase usecase) =>
      DeleteOpenGroupRequestBloc(usecase.deleteOpenGroupRequest);

  @factory
  CreateOpenGroupRequestBloc createCreateOpenGroupRequestBloc(
          CommunityUsecase usecase) =>
      CreateOpenGroupRequestBloc(usecase.createOpenGroupRequest);

  @factory
  GetBossStatusBloc createGetBossStatusBloc(CommunityUsecase usecase) =>
      GetBossStatusBloc(usecase.getBossGroupStatus);
}
