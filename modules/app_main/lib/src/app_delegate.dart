import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_main/src/blocs/app/app_cubit.dart';
import 'package:app_main/src/blocs/auth/auth_cubit.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/authentication/splash/splash_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:app_main/src/presentation/shared/user/bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:app_core/app_core.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'application.dart';
import 'config/app_config_service.dart';
import 'core/services/notifications/notification_service.dart';
import 'core/services/notifications/push_notification_service.dart';
import 'di/di.dart';

abstract class IAppDelegate {
  Future<Widget> build(Map<String, dynamic> env);

  Future<void> run(Map<String, dynamic> env);

  UserSharePreferencesUsecase get userSharePreferencesUsecase => injector.get();

  DeviceService get deviceService => injector.get();

  GlobalKey<NavigatorState> get root => AppCoordinatorCore.root;

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
    await AppConfigService.init();
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    if (isMobile) {

      /// CONFIG NOTIFICATION
      /// Set the background messaging handler early on,
      /// as a named top-level function
      FirebaseMessaging.onBackgroundMessage(
          firebaseMessagingBackgroundHandler);
      await setupFlutterNotifications();
      // if (Configurations.isProduction) {
      //   FirebaseMessaging.onBackgroundMessage(
      //       firebaseMessagingBackgroundHandler);
      //   await setupFlutterNotifications();
      // }

      unawaited(SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]));
      unawaited(deviceService.setStatusBar());
      unawaited(deviceService.updateNavigationBarColors(false));
    }

    String initialRoute = SplashScreen.routeName;
    if (userSharePreferencesUsecase.isAuthenticated) {
      isAuthenticate.add(true);
      // initialRoute = DashBoardScreen.routeName;
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
        Provider<LiveChannelController>(create: (_) => getIt()),
        BlocProvider<LiveMessageBloc>(create: (_) => getIt()),
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
