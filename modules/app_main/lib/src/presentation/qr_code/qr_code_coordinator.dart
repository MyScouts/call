import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
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

  Future<T?> confirmLoginQrCode<T>({
    required String code,
    required AuthClaimType type,
    String? marshopId,
  }) {
    debugPrint("confirmLoginQrCode: $marshopId");
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is OnLoginQRCode) {
              showLoading();
            }

            if (state is LoginQRCodeSuccess) {
              hideLoading();
              showToastMessage("Xác nhận đăng nhập thành công!");
              context.startDashboardUtil();
            }

            if (state is LoginQRCodeFail) {
              hideLoading();
              switch (state.code) {
                case "MARSHOP_CUSTOMER_NOT_FOUND":
                  showToastMessage(
                      "Bạn chưa là khách hàng thường xuyên vui lòng đăng ký khách hàng thường xuyên.");
                  context.startReplaceRegisterCustomer(
                    marshopId: marshopId,
                  );
                  break;
                default:
                  showToastMessage(
                      "Đăng nhập thất bại.", ToastMessageType.error);
                  context.startDashboardUtil();
              }
            }
          },
          child: ActionDialog(
            isBack: false,
            title: "Bạn có muốn đăng nhập trên thiết bị?",
            actionTitle: S.current.confirm.capitalize(),
            onAction: () {
              context.read<UserCubit>().authQrCode(qrCode: code, type: type);
            },
          ),
        );
      },
    );
  }
}
