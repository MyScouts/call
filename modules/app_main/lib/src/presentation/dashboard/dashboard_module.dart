import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/usecases/community_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

typedef GetMyTeamsBloc = GetListBloc<Team>;

@module
abstract class DashBoardModule {
  @factory
  GetMyTeamsBloc getMyTeams(CommunityUsecase usecase) =>
      GetMyTeamsBloc(usecase.myTeams);
}
