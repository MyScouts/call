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
}
