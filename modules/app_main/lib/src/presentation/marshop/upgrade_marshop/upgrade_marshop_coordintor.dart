import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'widget/verify_phone_otp_dialog_widget.dart';

extension UpgradeAccountCoordinator on BuildContext {
  Future<T?> startDialogVerifyPhoneOTP<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return const AutoHideKeyboard(
          child: DialogContainerWidget(
            child: VerifyPhoneOTPDialogWidget(),
          ),
        );
      },
    );
  }

  Future<T?> congratulationRegisterCustomer<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return CongratulationDialog(
          title: "Chúc mừng bạn đã đăng ký V-Shop thành công!",
          summary:
              "Chúc bạn có những trải nghiệm tuyệt vời trên sản phẩm của chúng tôi",
          onPressed: () => context.startDashboardUtil(),
        );
      },
    );
  }
}
