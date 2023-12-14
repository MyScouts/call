import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/call/service/call_manager/impl/android_call_manager.dart';
import 'package:app_main/src/presentation/call/service/call_manager/impl/ios_call_manager.dart';
import 'package:app_main/src/presentation/call/stringee_bloc/stringee_bloc.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_drawer.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dash_bottom_bar.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dash_bottom_fab.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dashboard_base_v2.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dashboard_header_v2.dart';
import 'package:app_main/src/presentation/notification/notification_screen.dart';
import 'package:app_main/src/presentation/notification/state/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreenV2 extends StatefulWidget {
  static const String routeName = "dashboard";

  const DashBoardScreenV2({super.key});

  @override
  State<DashBoardScreenV2> createState() => _DashBoardScreenV2State();
}

class _DashBoardScreenV2State extends State<DashBoardScreenV2>
    with AutomaticKeepAliveClientMixin {
  BottomBarType _type = BottomBarType.c;
  final PageController pageController = PageController();
  final GlobalKey<NotificationScreenState> notificationKey = GlobalKey();
  final GlobalKey<ScaffoldState> drawKey = GlobalKey<ScaffoldState>();
  final GlobalKey<DashBottomFabState> fabKey = GlobalKey<DashBottomFabState>();
  final GlobalKey<DashBoardBottomBarState> bottomKey =
      GlobalKey<DashBoardBottomBarState>();

  DashboardSharePreferenceUseCase get useCase =>
      getIt<DashboardSharePreferenceUseCase>();

  late final notificationBloc = getIt<NotificationBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      late final userId = context.read<UserCubit>().currentUser?.id ?? '';
      final page = useCase.getPageInitial('$userId');
      if (page != null) {
        pageController.jumpToPage(page);
        return;
      }
      final id = useCase.getInitPath('$userId') ?? '';
      if (id.trim().isEmpty) return;
      final item = [...communityItems, ...personalItems, ...ecoItems]
          .firstWhereOrNull((e) => e.id == id);
      final path = item?.path ?? '';
      context.handleStartAppWidget(id: id, path: path);
    });
    NotificationCenter.subscribe(
      channel: showAppStore,
      observer: this,
      onNotification: (data) {
        drawKey.currentState?.openEndDrawer();
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StringeeBloc>().add(ConnectionEvent());
    });
  }

  void _listenStringeeBloc(BuildContext context, StringeeState state) {
    if (state is IncomingCall) {
      if (isAndroid) {
        AndroidCallManager.shared.handleIncomingEvent(state.call, context);
      } else {
        IOSCallManager.shared.handleIncomingEvent(state.call, context);
      }
      // context.showIncomingCall(call: state.call);
    } else if (state is IncomingCall2) {
      if (isAndroid) {
        AndroidCallManager.shared.handleIncomingEvent2(state.call, context);
      } else {
        IOSCallManager.shared.handleIncomingEvent2(state.call, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Widget> children = [
      DashboardCommunity(context: context),
      const DashboardPersonal(),
      const DashboardEco()
    ];

    return BlocListener<StringeeBloc, StringeeState>(
      bloc: context.read<StringeeBloc>(),
      listener: _listenStringeeBloc,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<NotificationBloc>(
              create: (_) => notificationBloc,
            ),
          ],
          child: Material(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Scaffold(
                  key: drawKey,
                  endDrawer: DashboardDrawer(
                    page: BottomBarType.values.indexOf(_type),
                  ),
                  backgroundColor: const Color(0xffF4F4F4),
                  body: GestureDetector(
                    onTap: () {
                      fabKey.currentState?.revert();
                      bottomKey.currentState?.disableFab();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DashBoardV2Header(
                              onNotification: () {
                                notificationKey.currentState?.forward();
                              },
                              openAppStore: () {
                                drawKey.currentState?.openEndDrawer();
                              },
                              openSetting: () {
                                context.startSystemSetting(0);
                              },
                            ),
                            Expanded(
                              child: PageView.builder(
                                controller: pageController,
                                itemCount: children.length,
                                itemBuilder: (context, index) =>
                                    children[index],
                                onPageChanged: (page) {
                                  if (mounted) {
                                    setState(() {
                                      _type = BottomBarType.fromIndex(page);
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: (ScreenUtil().screenWidth - 32) / 2 + 8,
                          child: DashBottomFab(key: fabKey),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: DashBoardBottomBar(
                    key: bottomKey,
                    type: _type,
                    onChanged: (type) {
                      pageController.animateToPage(
                        BottomBarType.values.indexOf(type),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    onFabChange: (value) {
                      if (value) {
                        fabKey.currentState?.forward();
                      } else {
                        fabKey.currentState?.revert();
                      }
                    },
                  ),
                ),
                NotificationScreen(
                  key: notificationKey,
                  onClose: () {
                    notificationKey.currentState?.revert();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
