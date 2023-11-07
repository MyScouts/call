import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../register_customer/widget/verify_phone_otp_dialog_widget.dart';

extension RegisterMarshopCoordinator on BuildContext {
  Future<T?> startDialogVerifyRegisterMarshop<T>({
    required int marshopId,
    required String name,
    required int userId,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return BlocListener<MarshopCubit, MarshopState>(
          listener: (context, state) {},
          child: AutoHideKeyboard(
            child: DialogContainerWidget(
              child: VerifyPhoneOTPDialogWidget(onVerify: (otpCode) {
                context.read<MarshopCubit>().registerMarshop(
                      userId,
                      RegisterMarshopPayload(
                        name: name,
                        referralId: marshopId,
                        otp: otpCode,
                      ),
                    );
              }),
            ),
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

  Future<T?> congratulationRegisterMarshop<T>() {
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
