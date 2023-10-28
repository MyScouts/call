import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'upgrade_ja/upgrade_ja_screen.dart';

extension UpgradeAccountCoordinator on BuildContext {
  // Future<T?> startUpgradePDoneAccount<T>(int currentStep) {
  //   return Navigator.of(this)
  //       .pushNamed(UpgradePDoneScreen.routeName, arguments: {
  //     'currentStep': currentStep,
  //   });
  // }

  // Future<T?> startDialogUpgradeKYC<T>() {
  //   return showDialog<T>(
  //     context: this,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return Dialog(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(12)),
  //         ),
  //         child: BlocProvider<UpgradeAccountKycBloc>(
  //           create: (context) => injector.get(),
  //           child: const UpgradeKycWidget(),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Upgrade Account PDone
  // Future<T?> startDialogVerifyOTP<T>(RegisterPDoneResponse res) {
  //   return showGeneralDialog<T>(
  //     context: this,
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     pageBuilder: (context, animation1, animation2) {
  //       return BlocProvider.value(
  //         value: injector.get<UpgradePDoneBloc>(),
  //         child: AutoHideKeyboard(
  //           child: DialogContainerWidget(
  //             child: UpgradeAccountVerifyOTPWidget(res: res),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future<T?> startDialogCheckProtectorVerifyOTP<T>(
  //     RegisterPDoneResponse res, CheckProtectorPayload payload) {
  //   return showGeneralDialog<T>(
  //     context: this,
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     pageBuilder: (context, animation1, animation2) {
  //       return MultiBlocProvider(
  //         providers: [
  //           BlocProvider<CheckProtectorBloc>(
  //             create: (context) => injector.get(),
  //           ),
  //           BlocProvider<CheckProtectorVerifyOTPBloc>(
  //             create: (context) => injector.get(),
  //           ),
  //         ],
  //         child: AutoHideKeyboard(
  //           child: DialogContainerWidget(
  //             child: CheckProtectorVerifyOTPDialogWidget(
  //               res: res,
  //               payload: payload,
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Upgrade Account JA, VShop
  // Future<T?> startDialogVerifyPhoneOTP<T>(
  //     UpgradeAccountResponse res, PDoneActionType type) {
  //   return showGeneralDialog<T>(
  //     context: this,
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     pageBuilder: (context, animation1, animation2) {
  //       return MultiBlocProvider(
  //         providers: [
  //           BlocProvider<UpgradeAccountVerifyPhoneBloc>(
  //             create: (context) => injector.get(),
  //           ),
  //           BlocProvider<ResendOTPPhoneBloc>(
  //             create: (context) => injector.get(),
  //           ),
  //         ],
  //         child: AutoHideKeyboard(
  //           child: DialogContainerWidget(
  //             child: VerifyPhoneOTPDialogWidget(response: res, type: type),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future<T?> startDialogUpgradeAccountSuccess<T>(String text) {
  //   return showGeneralDialog<T>(
  //     context: this,
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     pageBuilder: (context, animation1, animation2) {
  //       return UpgradeSuccessDialogWidget(text: text);
  //     },
  //   );
  // }

  Future<T?> startDialogWarningUpgradeJA<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return const WarningDialog(
          title: 'Thành viên đủ 15 tuổi mới có thể đăng ký JA',
          content: '',
        );
      },
    );
  }

  Future<T?> startDialogUpgradeJA<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ActionDialog(
          title: 'Bạn chưa có hồ sơ JA, xác nhận đăng ký mới?',
          actionTitle: 'Xác nhận',
          onAction: () {},
        );
      },
    );
  }

  Future<T?> startUpgradeJA<T>({Team? team}) {
    return Navigator.of(this).pushNamed(
      UpgradeJAScreen.routeName,
      arguments: {'team': team},
    );
  }
}
