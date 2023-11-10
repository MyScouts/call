import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_background_builder.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_community_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_ecommerce_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_personal_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dock_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/statusbar_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/notification/notification_screen.dart';
import 'package:app_main/src/presentation/notification/notification_screen.dart';
import 'package:design_system/design_system.dart';
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

  int _page = 0;

  bool _showNotification = false;

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
                      openAppStore: () => context.startSystemSetting(_page),
                      openNotification: () {
                        setState(() {
                          _showNotification = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: const [
                        DashBoardCommunityTab(),
                        DashBoardPersonalTab(),
                        DashBoardEcommerceTab(),
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
            if (_showNotification)
              NotificationScreen(
                onClose: () {
                  setState(() {
                    _showNotification = false;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
