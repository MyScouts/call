part of 'team_detail_bloc.dart';

@immutable
abstract class TeamDetailState {}

class TeamDetailInitial extends TeamDetailState {}

class LoadingTeamDetail extends TeamDetailInitial {}

class FetchTeamDetailSuccess extends TeamDetailInitial {
  final Team team;

  FetchTeamDetailSuccess(this.team);
}

class FetchTeamsMemberSuccess extends FetchTeamDetailSuccess {
  final List<User> members;

  FetchTeamsMemberSuccess(this.members, super.team);
}

class AskToJoinLoading extends TeamDetailInitial {}

class AskToJoinSuccess extends TeamDetailInitial {}

class AskToJoinError<T> extends TeamDetailInitial {
  final dynamic error;

  AskToJoinError(this.error);
}

class AskToLeaveTeamLoading extends TeamDetailInitial {}

class AskToLeaveTeamSuccess extends TeamDetailInitial {}

class GetLeaveTeamStatusLoading extends TeamDetailInitial {}

class GetLeaveTeamStatusSuccess extends TeamDetailInitial {
  final LeaveTeamStatusResponse requests;

  GetLeaveTeamStatusSuccess(this.requests);
}

class TeamDetailError<T> extends TeamDetailInitial {
  final dynamic error;

  TeamDetailError(this.error);
}

class OnAssignBoss extends TeamDetailInitial {}

class AssignBossSuccess extends TeamDetailInitial {
  final int bossId;
  AssignBossSuccess({required this.bossId});
}

class AssignBossFail extends TeamDetailInitial {
  final String message;
  AssignBossFail({required this.message});
}

class OnRevokeBoss extends TeamDetailInitial {}

class RevokeBossSuccess extends TeamDetailInitial {}

class RevokeBossFail extends TeamDetailInitial {
  final String message;
  RevokeBossFail({required this.message});
}
