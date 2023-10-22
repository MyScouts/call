import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:base_clean_architecture/src/core/services/notification/mixins/notification_mixin.dart';
import 'package:base_clean_architecture/src/core/services/notification/notification_service.dart';
import 'package:base_clean_architecture/src/di/di.dart';
import 'package:base_clean_architecture/src/presentation/notification/deeplink/bloc/deeplink_bloc.dart';
import 'package:base_clean_architecture/src/presentation/routes.dart';
import 'package:base_clean_architecture/src/presentation/shared/app_setting/bloc/app_setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/coordinator/app_coordinator.dart';
import 'core/utils/toast_message/toast_message.dart';


class Application extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final String initialRoute;
  final String title;
  final List<BlocProvider> providers;
  // final NotificationService notificationService;
  final bool isProduction;
  // final MyRouteObserver myRouteObserver;

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

class _ApplicationState extends State<Application>
    with WidgetsBindingObserver {
  void _onListenerAppSettingBloc(BuildContext context, AppSettingState state) {}

  Widget _buildMaterialApp(
      {required Locale? locale, ThemeData? light, ThemeData? dark}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppCoordinator.root,
      title: widget.title,
      theme: light,
      darkTheme: dark,
      // localizationsDelegates: LocalizationFactory.localizationsDelegates,
      // supportedLocales: LocalizationFactory.supportedLocales,
      locale: locale,
      navigatorObservers: [
        // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
        MyNavigatorObserver(),
        // widget.myRouteObserver,
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

  // void _onListenerPostActionBloc(
  //     BuildContext contextBuilder, PostActionState state) {
  //   if (state is HidePostSuccess) {
  //     final typePost = state.type.typeText(contextBuilder);
  //     contextBuilder.showToastMessage('Ẩn $typePost thành công');
  //   } else if (state is DeletePostSuccess) {
  //     final typePost = state.type.typeText(contextBuilder);
  //     contextBuilder.showToastMessage('Xoá $typePost thành công');
  //   } else if (state is ArchivePostSuccess) {
  //     final info = state.info;
  //     final actionTitle = info.archive ? 'Lưu' : 'Bỏ lưu';
  //     final resultTitle = info.isSuccess ? 'thành công' : 'thất bại';
  //     final typePost = state.type.typeText(contextBuilder);
  //     final message = '$actionTitle $typePost $resultTitle';

  //     contextBuilder.showToastMessage(message,
  //         info.isSuccess ? ToastMessageType.success : ToastMessageType.error);
  //   } else if (state is RequestUpToNewSuccess) {
  //     contextBuilder.showToastMessage(
  //         'Yêu cầu của bạn đang được\n Quản trị viên xét duyệt');
  //   } else if (state is RequestUpToNewFailed) {
  //     contextBuilder.showToastMessage(
  //         'Bài viết chưa đủ tương tác!', ToastMessageType.warning);
  //   } else if (state is ReportPostSuccess) {
  //     contextBuilder.showToastMessage('Báo cáo thành công!');
  //   } else if (state is HidePostDairyOfUserSuccess) {
  //     contextBuilder.showToastMessage('Ẩn nhật ký thành công!');
  //   } else if (state is SharePostSuccess) {
  //     contextBuilder.showToastMessage('Chia sẻ bài viết thành công!');
  //   }
  // }

  void _onListenerDeeplinkBloc(BuildContext context, DeeplinkState state) {
    if (state is DeeplinkOpend) {
      // AppCoordinator.root.currentContext?.startDeeplink(state.link);
    }
  }

  // void updateStatusBarColor() {
  //   unawaited(injector.get<DeviceService>().updateNavigationBarColors(false));
  //   injector.get<DeviceService>().setStatusBar();
  // }

  @override
  bool get isProduction => widget.isProduction;

  // @override
  // NotificationService get notificationService => throw UnimplementedError();

  // @override
  // void onListenerOpenNotification(Map<String, dynamic> notification) {
  //   // AppCoordinator.root.currentContext?.startOpenNotification(notification);
  // }

  @override
  GlobalKey<NavigatorState> get rootKey => AppCoordinator.root;

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
      light: theme,
      dark: theme,
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MultiBlocProvider(
        providers: widget.providers,
        child: BlocListener<DeeplinkBloc, DeeplinkState>(
          listener: _onListenerDeeplinkBloc,
          child: BlocConsumer<AppSettingBloc, AppSettingState>(
            listener: _onListenerAppSettingBloc,
            builder: (context, state) => _buildMaterialApp(
              locale: null,
              light: light,
              dark: dark,
            ),
          ),
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
