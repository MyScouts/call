import 'dart:async';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:base_clean_architecture/src/presentation/notification/deeplink/bloc/deeplink_bloc.dart';
import 'package:base_clean_architecture/src/presentation/shared/app_setting/bloc/app_setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application.dart';
import 'config/enviroments/configurations.dart';
import 'di/di.dart';

abstract class IAppDelegate {
  Future<Widget> build(Map<String, dynamic> env);
  Future<void> run(Map<String, dynamic> env);

  // SharedPreferences get sharedPreferences => injector.get();
  // DeviceService get deviceService => injector.get();
  // UserSharePreferencesUsecase get userSharePreferencesUsecase => injector.get();

  // GlobalKey<NavigatorState> get root => AppCoordinator.root;

  // void reset() {
  //   injector.reset();
  // }
}

final onLogout = BehaviorSubject();

@singleton
class AppDelegate extends IAppDelegate {
  AppDelegate() {
    // HttpOverrides.global = CertificateHttpOverrides();

    // ImageWidget.errorWidgetBuilder = () => LayoutBuilder(
    //       builder: (ctx, contrain) {
    //         final width = contrain.maxWidth > 240.0 ? 240.0 : contrain.maxWidth;
    //         return Container(
    //           width: width,
    //           alignment: Alignment.center,
    //           color: Theme.of(ctx).scaffoldBackgroundColor,
    //           child: ImageWidget(
    //             ImageConstants.imgdefault,
    //           ),
    //         );
    //       },
    //     );

    // onLogout.listen((value) {
    //   LoggerService.print('[AppDelegate] force logout');
    //   root.currentContext
    //       ?.read<AppSettingBloc>()
    //       .add(UserLogoutEvent(force: true));
    // });
  }

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
      // final myBlocObserver = MyBlocObserver();
      // Bloc.observer = myBlocObserver;
    }

    return Application(
      title: 'VDONE',
      isProduction: Configurations.isProduction,
      providers: [
        BlocProvider<DeeplinkBloc>(create: (context) => getIt.get()),
        BlocProvider<AppSettingBloc>(create: (context) => getIt.get()),
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
    }, (e, trace) {
    });
  }
}
