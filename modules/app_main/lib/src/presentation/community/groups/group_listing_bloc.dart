import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../../../data/models/responses/boss_community_status_response.dart';
import '../../../data/models/responses/confirm_response.dart';

typedef GetListGroupsBloc = GetListBloc<Group>;

typedef GetListTeamsBloc = GetListBlocParam1<Team, String>;

typedef GetFanGroupBloc = GetDetailBloc<FanGroup>;

typedef GetBossStatusBloc
    = GetDetailBlocParam1<BossCommunityStatusResponse, String>;

typedef RelinquishBossGroupBloc = GetDetailBlocParam1<ConfirmResponse, String>;

typedef GetGroupRequestsBloc = GetListBloc<GroupRequest>;

typedef ReplyGiveUpBossTeamBloc = GetDetailBlocParam2<ConfirmResponse, String,
    ReplyGiveUpBossTeamRolePayload>;
