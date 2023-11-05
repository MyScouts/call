import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/community_usecase.dart';

part 'group_detail_event.dart';

part 'group_detail_state.dart';

@injectable
class GroupDetailBloc extends Bloc<GroupDetailEvent, GroupDetailState> {
  final CommunityUsecase _communityUsecase;

  GroupDetailBloc(this._communityUsecase) : super(GroupDetailInitial()) {
    on<FetchGroupDetailEvent>(_onFetchGroupDetailEvent);
    on<UpdateGroupDetailEvent>(_onUpdateGroupDetailEvent);
  }

  FutureOr<void> _onFetchGroupDetailEvent(
      FetchGroupDetailEvent event, Emitter<GroupDetailState> emit) async {
    try {
      const page = 1;
      const pageSize = 20;
      final id = event.id;
      emit(LoadingGroupDetail());

      final group = await _communityUsecase.getGroupDetail(id);
      emit(FetchGroupDetailSuccess(group));

      final teams = await _communityUsecase.getTeamList(
        page: page,
        pageSize: pageSize,
        groupId: id,
      );

      emit(FetchTeamsSuccess(teams, group));
    } catch (_) {}
  }

  FutureOr<void> _onUpdateGroupDetailEvent(
      UpdateGroupDetailEvent event, Emitter<GroupDetailState> emit) {
    emit(FetchGroupDetailSuccess(event.group));
  }
}
