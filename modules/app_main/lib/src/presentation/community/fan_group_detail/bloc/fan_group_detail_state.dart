part of 'fan_group_detail_bloc.dart';

abstract class FanGroupDetailState {}

class FanGroupDetailInitial extends FanGroupDetailState {}

class LoadingFanGroupDetail extends FanGroupDetailState {}

class FetchFanGroupSuccess extends FanGroupDetailState {
  final FanGroup fanGroup;

  FetchFanGroupSuccess(this.fanGroup);
}

class FetchBossGroupSuccess extends FetchFanGroupSuccess {
  final List<Member> boss;

  FetchBossGroupSuccess(this.boss, super.fanGroup);
}

class FetchBossTeamSuccess extends FetchBossGroupSuccess {
  final List<Member> bossTeams;

  FetchBossTeamSuccess(this.bossTeams, super.boss, super.fanGroup);
}

class FetchTeamsMemberSuccess extends FetchBossTeamSuccess {
  final List<Member> members;

  FetchTeamsMemberSuccess(
    this.members,
    super.bossTeams,
    super.boss,
    super.fanGroup,
  );
}

class RegisterTeamSuccess extends FetchTeamsMemberSuccess {
  RegisterTeamSuccess(
    super.members,
    super.bossTeams,
    super.boss,
    super.fanGroup,
  );
}

class RegisterTeamError extends FetchTeamsMemberSuccess {
  final String errMsg;

  RegisterTeamError(
    this.errMsg,
    super.members,
    super.bossTeams,
    super.boss,
    super.fanGroup,
  );
}

class UpdateFanGroupSucccess extends RegisterTeamSuccess {
  UpdateFanGroupSucccess(
    super.members,
    super.bossTeams,
    super.boss,
    super.fanGroup,
  );
}
