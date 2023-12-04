import 'package:app_main/src/presentation/camera/camera_result_screen.dart';
import 'package:app_main/src/presentation/camera/camera_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/search/search_screen.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/background_picker.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/change_password_screen.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/system_setting.dart';
import 'package:app_main/src/presentation/dashboard_v2/dashboard_v2_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import '../notification/notification_screen.dart';

@injectable
class DashboardRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        DashBoardScreenV2.routeName: (context) {
          return const DashBoardScreenV2();
        },
        SearchScreen.routeName: (context) {
          return const SearchScreen();
        },
        SystemSetting.routerName: (context) {
          return SystemSettingData(
            page: settings.arguments as int? ?? 0,
            child: const SystemSetting(),
          );
        },
        BackgroundPicker.routerName: (context) {
          return const BackgroundPicker();
        },
        ChangePassword.routerName: (context) {
          return const ChangePassword();
        },
        NotificationScreen.routerName: (context) {
          return NotificationScreen(onClose: () => Navigator.pop(context));
        },
        CameraScreen.routeName: (context) {
          return const CameraScreen();
        },
        CameraResultScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return CameraResultScreen(file: args['file'] as XFile);
        },
      };
}
