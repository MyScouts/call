import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_main/src/core/services/notifications/mixins/notification_mixin.dart';
import 'package:app_main/src/core/services/notifications/notification_service.dart';
import 'package:app_main/src/core/socket/chat_socket.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_cubit.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
import 'package:app_main/src/presentation/chat/conversation/conversation_page.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
import 'package:app_main/src/presentation/routes.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'app_dimens.dart';
import 'app_scaffold.dart';
import 'app_size.dart';
import 'core/coordinator/app_coordinator.dart';
import 'core/utils/toast_message/toast_message.dart';
import 'presentation/chat/chat_room/chat_room_page.dart';
import 'presentation/notification/notification_coordinator.dart';

class Application extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final String initialRoute;
  final String title;
  final List<SingleChildStatelessWidget> providers;
  final bool isProduction;
  final NotificationService notificationService;

  const Application({
    super.key,
    this.savedThemeMode,
    required this.initialRoute,
    required this.title,
    required this.providers,
    required this.notificationService,
    this.isProduction = true,
    // required this.myRouteObserver,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application>
    with WidgetsBindingObserver, NotificationMixin {
  Widget _buildMaterialApp({
    required Locale? locale,
    ThemeData? light,
    ThemeData? dark,
  }) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppCoordinator.rootNavigator,
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
      ),
    );
  }

  MediaQuery _materialBuilder(BuildContext context, Widget? child) {
    final data = MediaQuery.of(context).copyWith(textScaleFactor: 1);
    setMediaQueryData(data);
    SizeConfig.init(context);
    return MediaQuery(
      data: data,
      child: Overlay(
        key: AppCoordinator.overlayKey,
        initialEntries: [
          OverlayEntry(
            builder: (context) {
              return Material(
                child: Stack(
                  children: [
                    toastBuilder(context, AppScaffold(child: child!)),
                    Obx(() {
                      if (PipHandler.showPip.value) {
                        return PipHandler.pipView;
                      }
                      return const SizedBox.shrink();
                    }),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get isProduction => widget.isProduction;

  @override
  NotificationService get notificationService => widget.notificationService;

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
      //   ChatSocket().connect();
      if (MyNavigatorObserver.listRoute.contains(ChatRoomPage.routeName)) {
        getIt.get<ChatRoomCubit>().loadMessages();
      } else if (MyNavigatorObserver.listRoute
          .contains(ConversationPage.routeName)) {
        getIt.get<ConversationCubit>().loadNewConversation();
      }
    }
    // else if (state == AppLifecycleState.paused) {
    //   ChatSocket().disconnect();
    // }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ChatSocket().disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return AdaptiveTheme(
      light: theme.getTheme(Brightness.light),
      dark: theme.getTheme(Brightness.dark),
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MultiProvider(
        providers: widget.providers,
        child: _buildMaterialApp(
          locale: const Locale('vi', 'VN'),
          light: light,
          dark: dark,
        ),
      ),
    );
  }

  @override
  void onListenerOpenNotification(Map<String, dynamic> notification) {
    AppCoordinator.rootNavigator.currentContext
        ?.startOpenNotification(notification);
  }

  @override
  GlobalKey<NavigatorState> get rootKey => AppCoordinator.rootNavigator;
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
