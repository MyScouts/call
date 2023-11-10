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

class AssignBossEvent extends TeamDetailEvent {
  final String teamId;
  final AssignBossPayload payload;
  AssignBossEvent({required this.payload, required this.teamId});
}

class RevokeBossEvent extends TeamDetailEvent {
  final String teamId;
  RevokeBossEvent({required this.teamId});
}

class KickMember extends TeamDetailEvent {
  final int userId;
  final String teamId;
  KickMember(this.userId, this.teamId);
}
