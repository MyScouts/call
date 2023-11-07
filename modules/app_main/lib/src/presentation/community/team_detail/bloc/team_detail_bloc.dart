import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/models/responses/leave_team_status_response.dart';
import '../../../../domain/usecases/community_usecase.dart';

part 'team_detail_event.dart';

part 'team_detail_state.dart';

@injectable
class TeamDetailBloc extends Bloc<TeamDetailEvent, TeamDetailState> {
  final CommunityUsecase _communityUsecase;

  TeamDetailBloc(this._communityUsecase) : super(TeamDetailInitial()) {
    on<FetchTeamDetailEvent>(_onFetchTeamDetailEvent);
    on<UpdateTeamDetailEvent>(_onUpdateTeamDetailEvent);
    on<AskToJoinEvent>(_onAskToJoinEvent);
    on<AskToLeaveTeamEvent>(_onAskToLeaveTeamEvent);
    on<GetLeaveTeamStatusEvent>(_onGetLeaveTeamStatusEvent);
  }

  FutureOr<void> _onFetchTeamDetailEvent(
      FetchTeamDetailEvent event, Emitter<TeamDetailState> emit) async {
    emit(LoadingTeamDetail());

    final team = await _communityUsecase.getTeamById(event.id);

    emit(FetchTeamDetailSuccess(team));

    final members = await _communityUsecase.getMembers(event.id);

    emit(FetchTeamsMemberSuccess(members, team));
  }

  FutureOr<void> _onUpdateTeamDetailEvent(
      UpdateTeamDetailEvent event, Emitter<TeamDetailState> emit) {
    emit(FetchTeamDetailSuccess(event.team));
  }

  Future<FutureOr<void>> _onAskToJoinEvent(
      AskToJoinEvent event, Emitter<TeamDetailState> emit) async {
    emit(AskToJoinLoading());

    try {
      await _communityUsecase.askToJoinTeam(event.teamId);

      emit(AskToJoinSuccess());
    } on DioException catch (e) {
      emit(AskToJoinError(e));

      if (kDebugMode) {
        rethrow;
      }
    } catch (e) {
      emit(AskToJoinError(e));
      if (kDebugMode) {
        rethrow;
      }
    }
  }

  Future<FutureOr<void>> _onAskToLeaveTeamEvent(
      AskToLeaveTeamEvent event, Emitter<TeamDetailState> emit) async {
    emit(AskToLeaveTeamLoading());

    try {
      await _communityUsecase.askToLeaveTeam(event.teamId);

      emit(AskToLeaveTeamSuccess());
    } on DioException catch (e) {
      emit(TeamDetailError(e));

      if (kDebugMode) {
        rethrow;
      }
    } catch (e) {
      emit(TeamDetailError(e));
      if (kDebugMode) {
        rethrow;
      }
    }
  }

  Future<FutureOr<void>> _onGetLeaveTeamStatusEvent(
      GetLeaveTeamStatusEvent event, Emitter<TeamDetailState> emit) async {
    emit(GetLeaveTeamStatusLoading());

    try {
      final result = await _communityUsecase.getLeaveTeamStatus();

      emit(GetLeaveTeamStatusSuccess(result));
    } on DioException catch (e) {
      emit(TeamDetailError(e));

      if (kDebugMode) {
        rethrow;
      }
    } catch (e) {
      emit(TeamDetailError(e));
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}
