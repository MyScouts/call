import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/settings/setting_screen.dart';
import 'package:app_main/src/presentation/protector/manage_protector_screen.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        SettingScreen.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetJAStatusBloc>(
                  create: (context) => injector.get()),
              BlocProvider<UserCubit>.value(value: injector.get<UserCubit>()),
              BlocProvider<ConfirmRegisterJABloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: const SettingScreen(),
          );
        },
        ManageProtectorScreen.routerName: (context) {
          return const ManageProtectorScreen();
        }
      };
}
