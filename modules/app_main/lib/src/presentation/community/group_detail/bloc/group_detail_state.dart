part of 'group_detail_bloc.dart';

@immutable
abstract class GroupDetailState {}

class GroupDetailInitial extends GroupDetailState {}

class LoadingGroupDetail extends GroupDetailInitial {}

class FetchGroupDetailSuccess extends GroupDetailInitial {
  final Group group;

  FetchGroupDetailSuccess(this.group);
}

class FetchTeamsSuccess extends FetchGroupDetailSuccess {
  final List<Team> teams;

  FetchTeamsSuccess(this.teams, super.group);
}

class GetOtpSuccess extends GroupDetailState {}

class GetOtpLoading extends GroupDetailState {}