part of 'team_detail_bloc.dart';

@immutable
abstract class TeamDetailEvent {}

class FetchTeamDetailEvent extends TeamDetailEvent {
  final int id;

  FetchTeamDetailEvent(this.id);
}

class UpdateTeamDetailEvent extends TeamDetailEvent {
  final Team team;

  UpdateTeamDetailEvent(this.team);
}
