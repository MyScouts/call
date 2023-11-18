import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/camera/camera_result_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_module.dart';
import 'package:app_main/src/presentation/dashboard/search/search_screen.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/system_setting.dart';
import 'package:app_main/src/presentation/dashboard/widget/start_team_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import 'dashboard/widget/dashboard_option_sheet.dart';
import 'dashboard/widget/remove_confirm_dialog.dart';
import '../notification/notification_screen.dart';

extension DashBoardCoordinator on BuildContext {
  Future<T?> startDashboardUtil<T>() {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      DashBoardScreen.routeName,
      (route) => false,
    );
  }

  Future showAppStore() {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      builder: (context) => const DashBoardOptionSheet(),
    );
  }

  Future<T?> startSystemSetting<T>(int page) {
    return Navigator.of(this).pushNamed(
      SystemSetting.routerName,
      arguments: page,
    );
  }

  Future<T?> startNotification<T>() {
    return Navigator.of(this).pushNamed(NotificationScreen.routerName);
  }

  Future<T?> startSearch<T>() {
    return Navigator.of(this).pushNamed(SearchScreen.routeName);
  }

  void removeConfirm({required Function() onRemoved}) {
    showDialog(
      context: this,
      builder: (_) {
        return RemoveConfirmDialog(onRemoved: onRemoved);
      },
    );
  }

  Future<T?> startCameraResult<T>({required XFile file}) {
    return Navigator.of(this)
        .pushNamed(CameraResultScreen.routeName, arguments: {
      "file": file,
    });
  }

  Future<T?> _startTeam<T>() async {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    injector.get<GetMyTeamsBloc>()..add(GetListDataEvent())),
          ],
          child: const StartTeamDialog(),
        );
      },
    );
  }

  Future<T?> handleStartAppWidget<T>({required String id, String? path}) async {
    switch (id) {
      case "ic_team":
        return _startTeam();
      default:
        if (path != null) {
          Navigator.of(this).pushNamed(path);
        }
        break;
    }
    return null;
  }
}
