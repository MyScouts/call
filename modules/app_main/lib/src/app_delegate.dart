import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_main/src/blocs/app/app_cubit.dart';
import 'package:app_main/src/blocs/auth/auth_cubit.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/authentication/splash/splash_screen.dart';
import 'package:app_main/src/presentation/shared/user/bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:app_core/app_core.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'application.dart';
import 'config/app_config_service.dart';
import 'core/services/notifications/call_push_service_handler.dart';
import 'core/services/notifications/notification_service.dart';
import 'core/services/notifications/push_notification_service.dart';
import 'di/di.dart';
import 'presentation/call/stringee_bloc/stringee_bloc.dart';

abstract class IAppDelegate {
  Future<Widget> build(Map<String, dynamic> env);

  Future<void> run(Map<String, dynamic> env);

  UserSharePreferencesUsecase get userSharePreferencesUsecase => injector.get();

  DeviceService get deviceService => injector.get();

  GlobalKey<NavigatorState> get root => AppCoordinatorCore.root;

  SharedPreferences get sharedPreferences => injector.get();

  void reset() {
    injector.reset();
  }
}

final onLogout = BehaviorSubject();
final isAuthenticate = BehaviorSubject()..add(false);

@singleton
class AppDelegate extends IAppDelegate {
  AppDelegate() {
    onLogout.listen((value) {
      LoggerService.print('[AppDelegate] force logout');
      if (value != null && value) {
        root.currentContext?.read<AppCubit>().logout();
      }
    });
  }

  @override
  Future<Widget> build(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    Configurations().setConfigurationValues(env);
    await configureDependencies(environment: Environment.prod);
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    await sharedPreferences.setString(keyEndpoint, Configurations.baseUrl);
    if (isMobile) {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      await setupFlutterNotifications();

      unawaited(SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]));
      unawaited(deviceService.setStatusBar());
      unawaited(deviceService.updateNavigationBarColors(false));
    }

    String initialRoute = SplashScreen.routeName;
    if (userSharePreferencesUsecase.isAuthenticated) {
      injector.get<AuthCubit>().autoLogin();
      unawaited(AppConfigService.init());
      isAuthenticate.add(true);
    }

    if (Configurations.isStudio) {
      final myBlocObserver = MyBlocObserver();
      Bloc.observer = myBlocObserver;
    }

    return Application(
      title: 'VDONE',
      isProduction: Configurations.isProduction,
      providers: [
        BlocProvider<UserBloc>(create: (_) => injector.get()),
        BlocProvider<UserCubit>(create: (_) => injector.get()),
        BlocProvider<MarshopCubit>(create: (_) => injector.get()),
        BlocProvider<AuthCubit>(create: (_) => injector.get()),
        BlocProvider<AppCubit>(create: (_) => injector.get()),
        BlocProvider<StringeeBloc>(create: (context) => injector.get()),
      ],
      savedThemeMode: savedThemeMode,
      initialRoute: initialRoute,
      notificationService: injector.get<NotificationService>(),
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
