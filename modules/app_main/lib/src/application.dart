import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/routes.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'core/coordinator/app_coordinator.dart';
import 'core/utils/toast_message/toast_message.dart';

class Application extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final String initialRoute;
  final String title;
  final List<BlocProvider> providers;
  final bool isProduction;

  const Application({
    Key? key,
    this.savedThemeMode,
    required this.initialRoute,
    required this.title,
    required this.providers,
    // required this.notificationService,
    this.isProduction = true,
    // required this.myRouteObserver,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  Widget _buildMaterialApp({
    required Locale? locale,
    ThemeData? light,
    ThemeData? dark,
  }) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppCoordinator.root,
      localizationsDelegates: LocalizationFactory.localizationsDelegates,
      supportedLocales: LocalizationFactory.supportedLocales,
      title: widget.title,
      theme: light,
      darkTheme: dark,
      locale: locale,
      navigatorObservers: [
        MyNavigatorObserver(),
      ],
      builder: _materialBuilder,
      onGenerateRoute: getIt.get<Routes>().generateRoute,
      initialRoute: widget.initialRoute,
    );
  }

  Overlay _materialBuilder(BuildContext context, Widget? child) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) {
            return Material(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: toastBuilder(context, child!),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    // updateStatusBarColor();
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // updateStatusBarColor();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return AdaptiveTheme(
      light: theme.getTheme(Brightness.light),
      dark: theme.getTheme(Brightness.dark),
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MultiBlocProvider(
        providers: widget.providers,
        child: _buildMaterialApp(
          locale: const Locale('vi', 'VN'),
          light: light,
          dark: dark,
        ),
      ),
    );
  }
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyNavigatorObserver extends NavigatorObserver {
  static List<Route<dynamic>> routeStack = [];

  static List<String> get listRoute =>
      routeStack.map((e) => e.settings.name ?? 'null').toList();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
    _notiOnRoutesChanged();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
    _notiOnRoutesChanged();
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    routeStack.removeLast();
    _notiOnRoutesChanged();
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    routeStack.removeLast();
    if (newRoute != null) {
      routeStack.add(newRoute);
    }
    _notiOnRoutesChanged();
  }

  static final _routeStream = StreamController<List<String>>.broadcast();

  static Stream<List<String>> get onRoutesChanged => _routeStream.stream;

  void _notiOnRoutesChanged() {
    _routeStream.add(listRoute);
  }
}
