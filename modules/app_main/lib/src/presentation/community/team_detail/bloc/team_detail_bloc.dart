import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:localization/generated/intl/messages_en.dart';
import 'package:localization/localization.dart';

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
    on<AssignBossEvent>(_assignBossEvent);
    on<RevokeBossEvent>(_revokeBossEvent);
    on<KickMember>(
      onKickMember,
      transformer: (event, mapper) => event.asyncExpand(mapper),
    );
  }

  void onKickMember(KickMember event, Emitter<TeamDetailState> emit) {
    _communityUsecase.kickMember(event.userId, event.teamId);
    if (state is FetchTeamsMemberSuccess) {
      final members = (state as FetchTeamsMemberSuccess)
          .members
          .where((e) => e.id != event.userId)
          .toList();
      emit(FetchTeamsMemberSuccess(
        members,
        (state as FetchTeamsMemberSuccess).team,
      ));
    }
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

  FutureOr<void> _assignBossEvent(
      AssignBossEvent event, Emitter<TeamDetailState> emit) async {
    if (state is OnAssignBoss) return;
    try {
      emit(OnAssignBoss());
      await _communityUsecase.assignBoss(event.teamId, event.payload);
      emit(AssignBossSuccess(bossId: event.payload.userId));
    } on DioException catch (error) {
      final data = error.response!.data;
      String err = S.current.messages_server_internal_error.capitalize();
      print(data);
      emit(AssignBossFail(message: err));
    } catch (error) {
      String err = S.current.messages_server_internal_error.capitalize();
      emit(AssignBossFail(message: err));
    }
  }

  FutureOr<void> _revokeBossEvent(
      RevokeBossEvent event, Emitter<TeamDetailState> emit) async {
    if (state is OnRevokeBoss) return;
    try {
      emit(OnRevokeBoss());
      await _communityUsecase.revokeBoss(event.teamId);
      emit(RevokeBossSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      String err = S.current.messages_server_internal_error.capitalize();
      print(data);
      emit(RevokeBossFail(message: err));
    } catch (error) {
      String err = S.current.messages_server_internal_error.capitalize();
      emit(RevokeBossFail(message: err));
    }
  }
}
