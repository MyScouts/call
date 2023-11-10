import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/presentation/settings/setting_screen.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_constants.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/update_bank_account_screen.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/widgets/verify_otp_bank_account_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart';
import '../../data/models/responses/register_pdone_response.dart';
import '../../data/models/responses/upgrade_account_response.dart';
import '../settings/contract_ja/contract_ja_screen.dart';
import 'upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'upgrade_ja/upgrade_ja_screen.dart';
import 'upgrade_ja/widgets/upgrade_success_widget.dialog.dart';
import 'upgrade_ja/widgets/verify_phone_otp_dialog_widget.dart';
import 'upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'upgrade_pdone/pages/register_state_page.dart';
import 'upgrade_pdone/upgrade_pdone_screen.dart';
import 'upgrade_pdone/views/widgets/upgrade_account_verify_otp_dialog.dart';

extension UpgradeAccountCoordinator on BuildContext {
  Future<T?> startDialogVerifyOTP<T>(RegisterPDoneResponse res) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return BlocProvider.value(
          value: injector.get<UpgradePDoneBloc>(),
          child: AutoHideKeyboard(
            child: DialogContainerWidget(
              child: UpgradeAccountVerifyOTPWidget(res: res),
            ),
          ),
        );
      },
    );
  }

  Future<T?> startDialogVerifyPhoneOTP<T>(UpgradeAccountResponse res) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UpgradeAccountVerifyPhoneBloc>(
              create: (context) => injector.get(),
            ),
            BlocProvider<ResendOTPPhoneBloc>(
              create: (context) => injector.get(),
            ),
          ],
          child: AutoHideKeyboard(
            child: DialogContainerWidget(
              child: VerifyPhoneOTPDialogWidget(response: res),
            ),
          ),
        );
      },
    );
  }

  Future<T?> upgradePdoneSuccess<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(top: 0, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          content: RegisterEKycStatePage(
            onClickBtn: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  Future<T?> startDialogVerifyBankAccountOTP<T>({
    required UpdateBankAccountBloc bloc,
    required UpdateBankAccountPayload payload,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UpdateBankAccountBloc>.value(
              value: bloc,
            ),
          ],
          child: AutoHideKeyboard(
            child: DialogContainerWidget(
              child: VerifyOTPBankAccountDialogWidget(payload: payload),
            ),
          ),
        );
      },
    );
  }

  Future<T?> startDialogCongratulationRegisterBank<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return CongratulationDialog(
          title: "Bạn đã đăng ký tài khoản ngân hàng thành công!",
          onPressed: () {
            Navigator.pushReplacementNamed(context, UpgradeJAScreen.routeName);
          },
        );
      },
    );
  }

  Future<T?> startDialogSendRequestJASuccess<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return CongratulationDialog(
          title: "Hồ sơ của bạn đã được gửi lên Admin!",
          onPressed: () {
            Navigator.of(context).popUntil(
              ModalRoute.withName(SettingScreen.routeName),
            );
          },
        );
      },
    );
  }

  Future<T?> startDialogCongratulationRegisterJA<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return CongratulationDialog(
          title: "Chúc mừng bạn đã trở thành JA!",
          onPressed: () {
            Navigator.pushReplacementNamed(context, SettingScreen.routeName);
          },
        );
      },
    );
  }

  Future<T?> startDialogUpgradeAccountSuccess<T>(String text) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return UpgradeSuccessDialogWidget(text: text);
      },
    );
  }

  Future<T?> startDialogWarningUpgradeJA<T>({required String title}) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return WarningDialog(title: title, content: '');
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
          onAction: startUpgradeJA,
        );
      },
    );
  }

  Future<T?> startDialogUpdateBankAccount<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ActionDialog(
          title: 'Bạn chưa có tài khoản ngân hàng, xác nhận đăng ký mới?',
          actionTitle: 'Xác nhận',
          onAction: startUpdateBankAccount,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  Future<T?> startDialogConfirmRegisterJA<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        final confirmRegisterJABloc = injector.get<ConfirmRegisterJABloc>();
        return ActionDialog(
          title:
              'Hồ sơ của bạn đã được Admin phê duyệt. Xác nhận trở thành JA?',
          actionTitle: 'Xác nhận',
          onAction: () {
            confirmRegisterJABloc.add(
              GetDetailDataParam1Event(
                ConfirmRegisterJAPayload(isConfirmed: true),
              ),
            );
          },
          onCancel: () {
            confirmRegisterJABloc.add(
              GetDetailDataParam1Event(
                ConfirmRegisterJAPayload(isConfirmed: false),
              ),
            );
          },
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

  Future<T?> startContractJA<T>() {
    return Navigator.of(this).pushNamed(ContractJAScreen.routeName);
  }

  Future<T?> startUpgradePDone<T>() {
    return Navigator.of(this).pushNamed(
      UpgradePDoneScreen.routeName,
    );
  }

  Future<T?> startUpdateBankAccount<T>() {
    return Navigator.of(this).pushNamed(UpdateBankAccountScreen.routeName);
  }

  void startUpgradeJAFlow({JAStatusModel? jaStatus, User? user}) {
    if (jaStatus == null) {
      if (user?.isJA == true) {
        startContractJA();
      } else if (user?.isPDone == true) {
        final isUnder15 = user?.birthday?.isUnder15yearsAgo() ?? true;
        if (isUnder15) {
          startDialogWarningUpgradeJA(
            title: 'Thành viên đủ 15 tuổi mới có thể đăng ký JA',
          );
        } else {
          startDialogUpgradeJA();
        }
      } else {
        startDialogWarningUpgradeJA(title: 'Bạn cần đăng ký PDone trước.');
      }
    } else {
      if (jaStatus.status == JAStatus.pending.value) {
        startDialogWarningUpgradeJA(
          title: 'Hồ sơ của bạn đang được chờ duyệt!',
        );
      } else if (jaStatus.status == JAStatus.waitingForUserConfirmation.value) {
        startDialogConfirmRegisterJA();
      } else if (jaStatus.status == JAStatus.accepted.value) {
        startContractJA();
      } else if (jaStatus.status == JAStatus.adminRejected.value ||
          jaStatus.status == JAStatus.userRejected.value) {
        startDialogUpgradeJA();
      } else {
        startDialogUpgradeJA();
      }
    }
  }
}
