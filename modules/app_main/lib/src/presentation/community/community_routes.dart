import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/group_detail/group_request_list_screen.dart';
import 'package:app_main/src/presentation/community/group_detail/register_boss_group_screen.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/community/notification/community_notification_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/ask_to_join_team_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/assign_boss_team_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/update_team_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../information_profile/bloc/bloc/information_update_profil_bloc.dart';
import 'edit_community_detail/bloc/edit_community_detail_bloc.dart';
import 'edit_community_detail/edit_community_detail_screen.dart';
import 'group_detail/bloc/group_detail_bloc.dart';
import 'group_detail/edit_group_detail.dart';
import 'group_detail/group_detail_screen.dart';
import 'group_detail/request_boss_group_otp_screen.dart';
import 'group_detail/update_group_options_screen.dart';
import 'team_detail/bloc/team_detail_bloc.dart';
import 'team_detail/pages/ask_tojoin_team_success_screen.dart';
import 'team_detail/pages/team_request_list_screen.dart';
import 'team_detail/team_detail_screen.dart';

@injectable
class CommunityRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        GroupDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return BlocProvider<GroupDetailBloc>(
            create: (context) => get(),
            child: GroupDetailScreen(id: args['id']),
          );
        },
        TeamDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return MultiBlocProvider(
            providers: [
              BlocProvider<TeamDetailBloc>(
                create: (context) => get(),
              ),
              BlocProvider<GetJoinRequestBloc>(
                create: (context) => get(),
              ),
            ],
            child: TeamDetailScreen(
              id: args['id'],
              name: args['name'],
              bossGroupId: args['bossGroupId'],
            ),
          );
        },
        EditCommunityDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return BlocProvider<EditCommunityDetailBloc>(
            create: (context) => injector.get(param1: args['community']),
            child: EditCommunityDetailScreen(
              community: args['community'],
              type: args['type'],
            ),
          );
        },
        EditGroupDetail.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetBossStatusBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<RelinquishBossRoleBloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: const EditGroupDetail(),
          );
        },
        GroupRequestListScreen.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetGroupRequestsBloc>(
                create: (context) => injector.get()..add(GetListDataEvent()),
              ),
              BlocProvider<ReplyGiveUpBossTeamBloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: const GroupRequestListScreen(),
          );
        },
        AskToJoinTeamScreen.routeName: (context) {
          final args = settings.arguments as String;
          return BlocProvider.value(
            value: injector.get<TeamDetailBloc>(),
            child: AskToJoinTeamScreen(teamId: args),
          );
        },
        AskToJoinTeamSuccessScreen.routeName: (context) {
          return const AskToJoinTeamSuccessScreen();
        },
        TeamRequestListScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return TeamRequestListScreen(
            team: args['team'],
          );
        },
        UpdateTeamOptionsScreen.routeName: (context) {
          final args = settings.arguments as Team;
          return MultiBlocProvider(
            providers: [
              BlocProvider<RelinquishBossRoleBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<GetBossTeamRelinquishStatusBloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: UpdateTeamOptionsScreen(team: args),
          );
        },
        UpdateGroupOptionScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetBossStatusBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<RelinquishBossRoleBloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: UpdateGroupOptionScreen(community: args['community']),
          );
        },
        AssignBossTeamScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return BlocProvider<TeamDetailBloc>(
            create: (context) => injector.get(),
            child: AssignBossTeamScreen(team: args['team']),
          );
        },
        CommunityNotificationScreen.routeName: (context) {
          return const CommunityNotificationScreen();
        },
        RequestBossGroupOtpScreen.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GroupDetailBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<CreateOpenGroupRequestBloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: const RequestBossGroupOtpScreen(),
          );
        },
        RegisterBossGroupScreen.routeName: (context) {
          return BlocProvider(
            create: (context) => injector.get<InformationUpdateProfilBloc>(),
            child: const RegisterBossGroupScreen(),
          );
        },
      };
}
