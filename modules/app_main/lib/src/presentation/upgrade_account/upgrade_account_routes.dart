import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'upgrade_ja/upgrade_ja_screen.dart';

@injectable
class UpgradeAccountRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        UpgradeJAScreen.routeName: (context) {
          final args = settings.arguments as Map;
          return UpgradeJAScreen(team: args['team']);
          //TODO: Multi bloc
          // return MultiBlocProvider(
          //   providers: [
          //     BlocProvider<UpgradeAccountBloc>(
          //       create: (context) => injector.get(),
          //     ),
          //     BlocProvider<GetListGroupsBloc>(
          //       create: (context) => injector.get()..add(GetListDataEvent()),
          //     ),
          //     BlocProvider<GetListTeamsBloc>(
          //       create: (context) => injector.get(),
          //     ),
          //     BlocProvider<GetListBanksBloc>(
          //       create: (context) => injector.get(),
          //     ),
          //     BlocProvider<GetGroupDetailByBossIDBloc>(
          //       create: (context) => injector.get(),
          //     ),
          //   ],
          //   child: UpgradeJAScreen(team: args['team']),
          // );
        },
      };
}
