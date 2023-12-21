import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        SettingScreen.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<UserCubit>.value(value: injector.get<UserCubit>()),
            ],
            child: const SettingScreen(),
          );
        },
      };
}
