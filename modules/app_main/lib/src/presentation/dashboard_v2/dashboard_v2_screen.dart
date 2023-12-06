import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/call_manager.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_store_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_drawer.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dash_bottom_bar.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dashboard_base_v2.dart';
import 'package:app_main/src/presentation/dashboard_v2/widget/dashboard_header_v2.dart';
import 'package:app_main/src/presentation/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool _showAppStore = false;

  DashboardSharePreferenceUseCase get useCase =>
      getIt<DashboardSharePreferenceUseCase>();

  @override
  void initState() {
    super.initState();
    CallManager.shared.initCallL(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      late final userId = context.read<UserCubit>().currentUser?.id ?? '';
      final page = useCase.getPageInitial('$userId');
      if(page != null) {
        pageController.jumpToPage(page);
        return;
      }
      final id = useCase.getInitPath('$userId') ?? '';
      if (id.trim().isEmpty) return;
      final item = [...communityItems, ...personalItems, ...ecoItems]
          .firstWhereOrNull((e) => e.id == id);
      final path = item?.path ?? '';
      if (path.trim().isEmpty) return;
      Navigator.of(context).pushNamed(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Widget> children = [
      DashboardCommunity(context: context),
      const DashboardPersonal(),
      const DashboardEco()
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
              endDrawer: const DashboardDrawer(),
              backgroundColor: const Color(0xffF4F4F4),
              body: Builder(
                builder: (ctx) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DashBoardV2Header(
                        onNotification: () {
                          notificationKey.currentState?.forward();
                        },
                        openAppStore: () {
                          Scaffold.of(ctx).openEndDrawer();
                        },
                        openSetting: () {
                          context.startSystemSetting(0);
                        },
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: children.length,
                          itemBuilder: (context, index) => children[index],
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
                  );
                },
              ),
              bottomNavigationBar: DashBoardBottomBar(
                type: _type,
                onChanged: (type) {
                  pageController.animateToPage(
                    BottomBarType.values.indexOf(type),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            NotificationScreen(
              key: notificationKey,
              onClose: () {
                notificationKey.currentState?.revert();
              },
            ),
            if (_showAppStore)
              AppStoreScreen(
                onClose: () {
                  setState(() {
                    _showAppStore = false;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
