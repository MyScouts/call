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
  final List<Member> members;

  FetchTeamsMemberSuccess(this.members, super.team);
}
