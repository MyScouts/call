import 'dart:typed_data';

import 'package:app_core/app_core.dart';
import 'package:app_main/app_main.dart';
import 'package:app_main/src/blocs/app/app_cubit.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/android_call_manager.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/call_manager.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/ios_call_manager.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_store_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_background_builder.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_base_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_community_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_ecommerce_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dashboard_personal_tab.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/dock_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/statusbar_widget.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
import 'package:app_main/src/presentation/notification/notification_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';
import 'package:ui/ui.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardInheritedData extends InheritedWidget {
  final PageController pageController;
  final DashBoardController dashBoardController;

  const DashBoardInheritedData({
    super.key,
    required super.child,
    required this.pageController,
    required this.dashBoardController,
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

  bool _showAppStore = false;

  bool get authenticate => isAuthenticate.value;

  late final DashBoardController dashBoardController;

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

  // void enableEditMode() {
  //   setState(() {
  //     _showEditMode = true;
  //   });
  // }

  // void disableEditMode() {
  //   setState(() {
  //     _showEditMode = false;
  //   });
  // }

  AndroidCallManager? _androidCallManager = AndroidCallManager.shared;
  IOSCallManager? _iOSCallManager = IOSCallManager.shared;

  @override
  void initState() {
    super.initState();
    dashBoardController = DashBoardController();
    NotificationCenter.subscribe(
      channel: showAppStore,
      observer: this,
      onNotification: (data) {
        setState(() {
          _showAppStore = true;
        });
      },
    );
    if (isAndroid) {
      _androidCallManager!.setContext(context);

      ///cấp quyền truy cập với android
      requestPermissions();
    } else {
      /// Cấu hình thư viện để nhận push notification và sử dụng Callkit để show giao diện call native của iOS
      _iOSCallManager!.configureCallKeep();
    }

    /// Lắng nghe sự kiện của StringeeClient(kết nối, cuộc gọi đến...)
    CallManager.shared.client.eventStreamController.stream.listen((event) {
      Map<dynamic, dynamic> map = event;
      switch (map['eventType']) {
        case StringeeClientEvents.didConnect:
          handleDidConnectEvent();
          break;
        case StringeeClientEvents.didDisconnect:
          handleDiddisconnectEvent();
          break;
        case StringeeClientEvents.didFailWithError:
          handleDidFailWithErrorEvent(
              map['body']['code'], map['body']['message']);
          break;
        case StringeeClientEvents.requestAccessToken:
          handleRequestAccessTokenEvent();
          break;
        case StringeeClientEvents.didReceiveCustomMessage:
          handleDidReceiveCustomMessageEvent(map['body']);
          break;
        case StringeeClientEvents.incomingCall:
          StringeeCall? call = map['body'];
          if (isAndroid) {
            _androidCallManager!.handleIncomingCallEvent(call!, context);
          } else {
            _iOSCallManager!.handleIncomingCallEvent(call!, context);
          }
          break;
        case StringeeClientEvents.incomingCall2:
          StringeeCall2? call = map['body'];
          if (isAndroid) {
            _androidCallManager!.handleIncomingCall2Event(call!, context);
          } else {
            _iOSCallManager!.handleIncomingCall2Event(call!, context);
          }
          break;
        default:
          break;
      }
    });
  }

  requestPermissions() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    List<Permission> permissions = [
      Permission.camera,
      Permission.microphone,
    ];
    if (androidInfo.version.sdkInt >= 31) {
      permissions.add(Permission.bluetoothConnect);
    }
    Map<Permission, PermissionStatus> statuses = await permissions.request();

    if (androidInfo.version.sdkInt >= 33) {
      // Register permission for show notification in android 13
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    }
  }

  Future<void> registerPushWithStringeeServer() async {
    if (isAndroid) {
      Stream<String> tokenRefreshStream =
          FirebaseMessaging.instance.onTokenRefresh;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? registered = (prefs.getBool("register") == null)
          ? false
          : prefs.getBool("register");

      ///kiểm tra đã register push chưa
      if (registered != null && !registered) {
        FirebaseMessaging.instance.getToken().then((token) {
          CallManager.shared.client.registerPush(token!).then((value) {
            if (value['status']) {
              prefs.setBool("register", true);
              prefs.setString("token", token);
            }
          });
        });
      }

      ///Nhận token mới từ firebase
      tokenRefreshStream.listen((token) {
        ///Xóa token cũ
        CallManager.shared.client
            .unregisterPush(prefs.getString("token")!)
            .then((value) {
          if (value['status']) {
            ///Register với token mới
            prefs.setBool("register", false);
            prefs.remove("token");
            CallManager.shared.client.registerPush(token).then((value) {
              if (value['status']) {
                prefs.setBool("register", true);
                prefs.setString("token", token);
              }
            });
          }
        });
      });
    } else {
      _iOSCallManager!.registerPushWithStringeeServer();
    }
  }

  /// StringeeClient Listeners
  ///
  void handleDidConnectEvent() {
    print("handleDidConnectEvent");
    if (!isAndroid) {
      _iOSCallManager!.startTimeoutForIncomingCall();
    }

    registerPushWithStringeeServer();
  }

  void handleDiddisconnectEvent() {
    print("handleDiddisconnectEvent");
    if (!isAndroid) {
      _iOSCallManager!.stopTimeoutForIncomingCall();
    }
  }

  void handleDidFailWithErrorEvent(int? code, String message) {
    print('code: ' + code.toString() + ', message: ' + message);
  }

  void handleRequestAccessTokenEvent() {
    print('Request new access token');
  }

  void handleDidReceiveCustomMessageEvent(Map<dynamic, dynamic> map) {
    print('from: ' + map['fromUserId'] + '\nmessage: ' + map['message']);
  }

  @override
  void dispose() {
    super.dispose();
    NotificationCenter.unsubscribe(channel: showAppStore, observer: this);
    dashBoardController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state is ForceLogoutSuccess) {
          context.startLoginUtil();
        }
      },
      child: DashBoardInheritedData(
        dashBoardController: dashBoardController,
        pageController: _pageController,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              DashBoardBackgroundBuilder(
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
                      child: ListenableBuilder(
                        listenable: dashBoardController,
                        builder: (_, __) {
                          return StatusBarWidget(
                            enableEditMode: dashBoardController.enableEditMode,
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
                              dashBoardController.enableEditMode = false;
                            },
                          );
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
                          NotificationCenter.post(
                            channel: dashboardPageChange,
                            options: _page,
                          );
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
                    onClick:
                        authenticate ? null : () => context.requiredLogin(),
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
