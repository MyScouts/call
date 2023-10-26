import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/authentication/authenticate_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:app_core/app_core.dart';
import 'package:rxdart/rxdart.dart';

import 'application.dart';
import 'di/di.dart';

abstract class IAppDelegate {
  Future<Widget> build(Map<String, dynamic> env);
  Future<void> run(Map<String, dynamic> env);
  UserSharePreferencesUsecase get userSharePreferencesUsecase => injector.get();
  void reset() {
    injector.reset();
  }
}

final onLogout = BehaviorSubject();

@singleton
class AppDelegate extends IAppDelegate {
  AppDelegate();

  @override
  Future<Widget> build(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    Configurations().setConfigurationValues(env);
    await configureDependencies(environment: Environment.prod);

    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    var initialRoute = AuthenticateScreen.routeName;
    if (userSharePreferencesUsecase.isAuthenticated) {
      initialRoute = DashboardScreen.routeName;
    }

    if (Configurations.isStudio) {
      final myBlocObserver = MyBlocObserver();
      Bloc.observer = myBlocObserver;
    }

    return Application(
      title: 'VDONE',
      isProduction: Configurations.isProduction,
      providers: [
        BlocProvider<UserCubit>(create: (_) => injector.get()),
      ],
      savedThemeMode: savedThemeMode,
      initialRoute: initialRoute,
    );
  }

  Future<void> _run(Map<String, dynamic> env) async {
    env.addAll({'hash': '61cfd25c'});

    final app = await build(env);
    runApp(app);
  }

  @override
  Future<void> run(Map<String, dynamic> env) async {
    await runZonedGuarded(() async {
      await _run(env);
    }, (e, trace) {});
  }
}
