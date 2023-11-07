part of 'team_detail_bloc.dart';

@immutable
abstract class TeamDetailEvent {}

class FetchTeamDetailEvent extends TeamDetailEvent {
  final String id;

  FetchTeamDetailEvent(this.id);
}

class UpdateTeamDetailEvent extends TeamDetailEvent {
  final Team team;

  UpdateTeamDetailEvent(this.team);
}

class AskToJoinEvent extends TeamDetailEvent {
  final String teamId;

  AskToJoinEvent(this.teamId);
}

class AskToLeaveTeamEvent extends TeamDetailEvent {
  final String teamId;

  AskToLeaveTeamEvent(this.teamId);
}

class GetLeaveTeamStatusEvent extends TeamDetailEvent {}
