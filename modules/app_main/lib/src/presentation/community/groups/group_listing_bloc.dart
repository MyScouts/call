import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';
import 'package:app_main/src/data/models/responses/join_request_response.dart';
import 'package:app_main/src/presentation/community/community_constants.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import '../../../data/models/responses/boss_community_status_response.dart';
import '../../../data/models/responses/boss_team_relinquish_status_response.dart';
import '../../../data/models/responses/confirm_response.dart';
import '../../../data/models/responses/open_group_request_response.dart';

typedef GetMyGroupsBloc = GetListBloc<Group>;

typedef GetListTeamsBloc = GetListBlocParam1<Team, String>;

typedef GetOpenGroupRequestBloc = GetDetailBloc<OpenGroupRequestResponse>;

// typedef GetOTPBloc = GetDetailBloc<dynamic>;

typedef DeleteOpenGroupRequestBloc = GetDetailBloc<dynamic>;

typedef GetGroupRequestsBloc = GetListBloc<GroupRequest>;

typedef CreateOpenGroupRequestBloc = GetDetailBlocParam1<dynamic, String>;

typedef GetBossStatusBloc
    = GetDetailBlocParam1<BossCommunityStatusResponse, String>;

typedef ReplyGiveUpBossTeamBloc = GetDetailBlocParam2<ConfirmResponse, String,
    ReplyGiveUpBossTeamRolePayload>;

typedef RelinquishBossRoleBloc
    = GetDetailBlocParam2<ConfirmResponse, String, CommunityType>;

typedef GetBossTeamRelinquishStatusBloc
    = GetDetailBlocParam1<BossTeamRelinquishStatusResponse, String>;

typedef GetJoinRequestBloc = GetListBloc<JoinRequest>;
