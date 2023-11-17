import 'dart:typed_data';

import 'package:app_main/app_main.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_store_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_background_builder.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_community_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_ecommerce_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_personal_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dock_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/statusbar_widget.dart';
import 'package:app_main/src/presentation/notification/notification_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:injectable/injectable.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ui/ui.dart';

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

  const DashBoardScreen({super.key, this.page});

  final int? page;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final controller = getIt<DashBoardScreenController>();
  late final PageController _pageController =
      PageController(initialPage: widget.page ?? (controller.mainPage ?? 0));
  final GlobalKey<NotificationScreenState> notificationKey = GlobalKey();

  late int _page = widget.page ?? (controller.mainPage ?? 0);

  bool _showEditMode = false;

  bool _showAppStore = false;
  bool get authenticate => isAuthenticate.value;

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
                      openAppStore: () {
                        setState(() {
                          _showAppStore = true;
                        });
                      },
                      openNotification: () {
                        if (!authenticate) {
                          context.requiredLogin();
                          return;
                        }
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ExpandableFab(
                  onClick: authenticate ? null : () => context.requiredLogin(),
                  fabMargin: 8,
                  children: [
                    ActionButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffBFE0FF),
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff66B2FF),
                                Color(0xff0080FF),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: ImageWidget(IconAppConstants.icEdit2),
                        ),
                        onPressed: () {
                          print("===M1");
                        }),
                    ActionButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffBFE0FF),
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff66B2FF),
                                Color(0xff0080FF),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: ImageWidget(IconAppConstants.icVideoOc),
                        ),
                        onPressed: () {
                          print("===M1");
                        }),
                    ActionButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffBFE0FF),
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff66B2FF),
                                Color(0xff0080FF),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: ImageWidget(IconAppConstants.icVideo),
                        ),
                        onPressed: () {
                          print("===M1");
                        }),
                  ],
                ),
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

@lazySingleton
class DashBoardScreenController extends ChangeNotifier {
  final DashboardSharePreferenceUseCase useCase;

  DashBoardScreenController(this.useCase) {
    mainPage = useCase.getPageInitial();
    capture();
  }

  int? mainPage;

  Uint8List? _page1;

  Uint8List? _page2;

  Uint8List? _page3;

  Uint8List? get page1 => _page1;

  Uint8List? get page2 => _page2;

  Uint8List? get page3 => _page3;

  ScreenshotController screenshotController = ScreenshotController();

  void save(int page) {
    useCase.savePage(page);
  }

  void capture() async {
    // _page1 = await screenshotController.captureFromWidget(
    //   const DashBoardScreen(page: 0),
    // );
    // _page2 = await screenshotController.captureFromWidget(
    //   const DashBoardScreen(page: 1),
    // );
    // _page3 = await screenshotController.captureFromWidget(
    //   const DashBoardScreen(page: 2),
    // );
  }
}
