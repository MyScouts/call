import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/settings/setting_screen.dart';
import 'package:app_main/src/presentation/settings/widget/confirm_delete_modal.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

extension SettingCoordinator on BuildContext {
  Future<T?> startSetting<T>() {
    return Navigator.of(this).pushNamed(SettingScreen.routeName);
  }

  Future<T?> confirmLogoutDialog<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is OnLogout) {
              showLoading();
            }

            if (state is LogoutSuccess) {
              hideLoading();
              showToastMessage("Đăng xuất thành công");
              context.startLoginUtil();
            }

            if (state is LogoutFail) {
              hideLoading();
              showToastMessage("Đăng xuất thất bại.");
            }
          },
          child: ActionDialog(
            title: "Bạn có muốn đăng xuất?",
            actionTitle: S.current.confirm.capitalize(),
            onAction: () => context.read<UserCubit>().onLogout(),
          ),
        );
      },
    );
  }

  Future<T?> confirmDeleteAccount<T>({required int userId}) {
    return showModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => BlocProvider(
        create: (context) => injector.get<UserCubit>(),
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is OnDeleteUser) {
              showLoading();
            }
            if (state is DeleteUserSuccess) {
              hideLoading();
              showToastMessage("Xoá tài khoản thành công");
              context.startLoginUtil();
            }

            if (state is DeleteUserFail) {
              hideLoading();
              showToastMessage(state.message, ToastMessageType.error);
            }
          },
          child: ConfirmDeleteModal(userId: userId),
        ),
      ),
    );
  }

  Future<T?> confirmUpgradeJA<T>({required Function() onConfirm}) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ActionDialog(
          title: "Bạn cần phải nâng cấp JA?",
          actionTitle: S.current.confirm.capitalize(),
          onAction: onConfirm,
        );
      },
    );
  }
}
