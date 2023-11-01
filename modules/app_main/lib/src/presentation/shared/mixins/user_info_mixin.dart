import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../app_coordinator.dart';
// import '../../profile/profile_coordinator.dart';
import '../app_setting/bloc/app_setting_bloc.dart';
import '../user/bloc/user_bloc.dart';

mixin UserInfoMixin<T extends StatefulWidget> on State<T> {
  bool isMeCheckWith(int? userId) => userId == currentUserId;

  int? get currentUserId => context.read<UserBloc>().state.currentUser?.id;

  void onTapInfo(int? userById) {
    // if (userById != null && currentUserId == userById) {
    //   context.startPDoneTab();
    // } else {
    //   if (userById != null) {
    //     context.startPDoneByUserId(userById);
    //   }
    // }
  }

  void onTapLogout() {
    // showDialogApplicationWithIcon(
    //   context,
    //   ImageWidget(IconConstants.logout, width: 48, height: 48),
    //   content: '''Bạn có chắc chắn muốn đăng xuất''',
    // ).then((value) {
    //   if (value == true) {
    //     context.read<AppSettingBloc>().add(UserLogoutEvent());
    //   }
    // });
  }
}
