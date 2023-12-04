import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_store_screen.dart';
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

class _DashBoardScreenV2State extends State<DashBoardScreenV2> {
  BottomBarType _type = BottomBarType.c;
  final PageController pageController = PageController();
  final GlobalKey<NotificationScreenState> notificationKey = GlobalKey();
  bool _showAppStore = false;

  @override
  Widget build(BuildContext context) {
    const List<Widget> children = [
      DashboardCommunity(),
      DashboardPersonal(),
      DashboardEco()
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
              backgroundColor: const Color(0xffF4F4F4),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DashBoardV2Header(
                    onNotification: () {
                      notificationKey.currentState?.forward();
                    },
                    openAppStore: () {
                      setState(() {
                        _showAppStore = true;
                      });
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
}
