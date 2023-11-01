import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/community/groups/groups_listing_widget.dart';
import 'package:app_main/src/presentation/shared/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import 'edit_community_detail/bloc/edit_community_detail_bloc.dart';
import 'edit_community_detail/edit_community_detail_screen.dart';
import 'edit_fan_group/bloc/edit_fan_group_bloc.dart';
import 'edit_fan_group/edit_fan_group_screen.dart';
import 'fan_group_detail/bloc/fan_group_detail_bloc.dart';
import 'fan_group_detail/fan_group_detail_screen.dart';
import 'group_detail/bloc/group_detail_bloc.dart';
import 'group_detail/group_detail_screen.dart';
import 'team_detail/bloc/team_detail_bloc.dart';
import 'team_detail/team_detail_screen.dart';

@injectable
class CommunityRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        GroupsListingWidget.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetListGroupsBloc>(
                create: (context) => injector.get(),
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
            child: GroupDetailScreen(
              id: args['id'],
              cover: args['cover'],
              groupName: args['groupName'],
            ),
          );
        },
        TeamDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return BlocProvider<TeamDetailBloc>(
            create: (context) => get(),
            child: TeamDetailScreen(
              id: args['id'],
              cover: args['cover'],
              name: args['name'],
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
      };
}
