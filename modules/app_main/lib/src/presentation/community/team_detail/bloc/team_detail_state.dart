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
