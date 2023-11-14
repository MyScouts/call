import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_background_builder.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_community_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_ecommerce_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_personal_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dock_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/statusbar_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DashBoardInheritedData extends InheritedWidget {
  final PageController pageController;

  const DashBoardInheritedData({
    super.key,
    required super.child,
    required this.pageController,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class DashBoardScreen extends StatefulWidget {
  static const String routeName = "dashboard";

  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final PageController _pageController = PageController();
  final GlobalKey<NotificationScreenState> notificationKey = GlobalKey();

  int _page = 0;

  bool _showEditMode = false;

  Widget _buildDot(BuildContext context, int index) {
    final page = _page;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: page == index ? Colors.white : Colors.white.withOpacity(.2),
      ),
    );
  }

  void enableEditMode() {
    setState(() {
      _showEditMode = true;
    });
  }

  void disableEditMode() {
    setState(() {
      _showEditMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashBoardInheritedData(
      pageController: _pageController,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            DashBoardBackgroundBuilder(
              key: const Key('bg_image'),
              page: _page,
              builder: (image) => ImageWidget(image, fit: BoxFit.fill),
            ),
            SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: StatusBarWidget(
                      enableEditMode: _showEditMode,
                      openAppStore: () => context.startSystemSetting(_page),
                      openNotification: () {
                        notificationKey.currentState?.forward();
                      },
                      onCanceled: () {
                        setState(() {
                          _showEditMode = false;
                        });
                        NotificationCenter.post(channel: cancelEditMode);
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: [
                        DashBoardCommunityTab(
                          enableEditMode: enableEditMode,
                          disableEditMode: disableEditMode,
                        ),
                        DashBoardPersonalTab(
                          enableEditMode: enableEditMode,
                          disableEditMode: disableEditMode,
                        ),
                        DashBoardEcommerceTab(
                          enableEditMode: enableEditMode,
                          disableEditMode: disableEditMode,
                        ),
                      ],
                      onPageChanged: (page) {
                        setState(() {
                          _page = page;
                        });
                      },
                    ),
                  ),
                  Builder(
                    builder: (ctx) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => _buildDot(ctx, index),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DockWidget(),
                  ),
                ],
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
    );
  }
}
