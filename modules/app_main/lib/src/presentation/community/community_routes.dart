import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/community/community.component.dart';
import 'package:app_main/src/presentation/community/group_detail/group_request_list_screen.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/community/groups/groups_listing_widget.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/ask_to_join_team_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/remove_member_sheet.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/assign_boss_team_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/update_team_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import 'edit_community_detail/bloc/edit_community_detail_bloc.dart';
import 'edit_community_detail/edit_community_detail_screen.dart';
import 'edit_fan_group/bloc/edit_fan_group_bloc.dart';
import 'edit_fan_group/edit_fan_group_screen.dart';
import 'fan_group_detail/bloc/fan_group_detail_bloc.dart';
import 'fan_group_detail/fan_group_detail_screen.dart';
import 'group_detail/bloc/group_detail_bloc.dart';
import 'group_detail/edit_group_detail.dart';
import 'group_detail/group_detail_screen.dart';
import 'group_detail/update_group_options_screen.dart';
import 'team_detail/bloc/team_detail_bloc.dart';
import 'team_detail/pages/ask_tojoin_team_success_screen.dart';
import 'team_detail/pages/team_request_list_screen.dart';
import 'team_detail/team_detail_screen.dart';

@injectable
class CommunityRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        CommunityWidget.routeName: (context) {
          return BlocProvider.value(
            value: injector.get<UserCubit>(),
            child: const CommunityWidget(),
          );
        },
        GroupsListingWidget.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetListGroupsBloc>(
                create: (context) => injector.get()..add(GetListDataEvent()),
              ),
              BlocProvider<GetFanGroupBloc>(
                create: (context) => injector.get(),
              )
            ],
            child: const GroupsListingWidget(),
          );
        },
        GroupDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return BlocProvider<GroupDetailBloc>(
            create: (context) => get(),
            child: GroupDetailScreen(id: args['id']),
          );
        },
        TeamDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return BlocProvider<TeamDetailBloc>(
            create: (context) => get(),
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
        FanGroupDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return BlocProvider<FanGroupDetailBloc>(
            create: (context) => get(),
            child: FanGroupDetailScreen(fanGroup: args['fanGroup']),
          );
        },
        EditFanGroupScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return BlocProvider<EditFanGroupBloc>(
            create: (context) => injector.get(param1: args['fanGroup']),
            child: EditFanGroupScreen(
              fanGroup: args['fanGroup'],
            ),
          );
        },
        EditGroupDetail.routeName: (context) {
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
          return const TeamRequestListScreen();
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
      };
}
