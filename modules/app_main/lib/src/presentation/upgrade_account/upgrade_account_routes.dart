import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import '../community/groups/group_listing_bloc.dart';
import 'upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'upgrade_ja/upgrade_ja_screen.dart';

@injectable
class UpgradeAccountRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        UpgradeJAScreen.routeName: (context) {
          final args = settings.arguments as Map;
          return MultiBlocProvider(
            providers: [
              BlocProvider<UpgradeAccountBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<GetListGroupsBloc>(
                create: (context) => injector.get()..add(GetListDataEvent()),
              ),
              BlocProvider<GetListTeamsBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<GetListBanksBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<GetGroupDetailByBossIDBloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: UpgradeJAScreen(team: args['team']),
          );
        },
      };
}
