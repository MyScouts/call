import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:app_core/app_core.dart';
import 'package:rxdart/rxdart.dart';

import 'application.dart';
import 'di/di.dart';

abstract class IAppDelegate {
  Future<Widget> build(Map<String, dynamic> env);
  Future<void> run(Map<String, dynamic> env);

  void reset() {
    injector.reset();
  }
}

final onLogout = BehaviorSubject();

@singleton
class AppDelegate extends IAppDelegate {
  AppDelegate() {}

  @override
  Future<Widget> build(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    Configurations().setConfigurationValues(env);
    await configureDependencies(environment: Environment.prod);

    // final userBloc = injector.get<UserBloc>();
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    var initialRoute = 'login';
    // if (userSharePreferencesUsecase.isAuthenticated) {
    //   initialRoute = 'dashboard';
    //   userBloc.add(AutoLoginEvent());
    // }

    if (Configurations.isStudio) {
      final myBlocObserver = MyBlocObserver();
      Bloc.observer = myBlocObserver;
    }

    return Application(
      title: 'VDONE',
      isProduction: Configurations.isProduction,
      providers: [],
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
