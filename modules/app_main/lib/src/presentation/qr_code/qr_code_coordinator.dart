import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_screen.dart';
import 'package:app_main/src/presentation/qr_code/scan_qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

extension DeeplinkCoordinator on BuildContext {
  Future<T?> startScanQrCode<T>({bool? showMyQr}) {
    return Navigator.of(this)
        .pushNamed(ScanQrCodeScanScreen.routeName, arguments: {
      "showMyQr": showMyQr,
    });
  }

  Future<T?> startQrCode<T>({required User userInfo}) {
    return Navigator.of(this).pushNamed(QrCodeScreen.routeName, arguments: {
      'userInfo': userInfo,
    });
  }

  Future<T?> confirmLoginQrCode<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is OnLoginQRCode) {
              showLoading();
            }

            if (state is LogoutSuccess) {
              hideLoading();
              showToastMessage("Xác nhận đăng nhập thành công!");
              context.startDashboardUtil();
            }

            if (state is LogoutFail) {
              hideLoading();
              showToastMessage("Đăng nhập thất bại.");
            }
          },
          child: ActionDialog(
            title: "Bạn có muốn đăng nhập trên thiết bị?",
            actionTitle: S.current.confirm.capitalize(),
            onAction: () => context.read<UserCubit>().onLogout(),
          ),
        );
      },
    );
  }
}
