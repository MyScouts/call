import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/app/app_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class Setting {
  final String text;
  final String? avatar;
  final String? icon;
  final Function()? onPressed;

  const Setting({
    required this.text,
    this.avatar,
    this.icon,
    this.onPressed,
  });

  static List<List<Setting>> session1Menus(
    BuildContext context, {
    User? user,
    OnBoarding? onboarding,
    required Function() onUpdate,
    required String osType,
    required bool isProduction,
  }) =>
      [
        [
          Setting(
            text: "Cài đặt tài khoản",
            icon: IconAppConstants.icSettingAccount,
            onPressed: () {},
          ),
          if ((user?.getAge ?? 0) >= 18)
            Setting(
              text: "Quản lý người bảo hộ",
              icon: IconAppConstants.icCare,
              onPressed: () {},
            ),
          Setting(
            text: "Tin nhắn office",
            icon: IconAppConstants.icChat,
          ),
        ],
        [
          Setting(
            text: "Team",
            icon: Assets.icons_ic_team_png.path,
            onPressed: () => {},
          ),
          Setting(
              text: "P-Done",
              icon: IconAppConstants.icUpgrade,
              onPressed: () {}),
          Setting(
            text: "JA",
            icon: IconAppConstants.icJA,
            onPressed: () {},
          ),
          Setting(
            text: "Khách hàng thường xuyên - Market Home",
            icon: IconAppConstants.icMarshopHome,
            onPressed: () {
              if (onboarding != null && onboarding.isMarshopCustomer) {
                context.showToastMessage("Bạn đã là Khách hàng thường xuyên");
              } else {}
            },
          ),
          Setting(
            text: "Tài khoản MarShop",
            icon: IconAppConstants.icMarshop,
            onPressed: () {
              if (onboarding != null && onboarding.isMarshopOwner) {
                context.showToastMessage("Bạn đã là MarShop");
              } else {}
            },
          ),
        ],
        [
          Setting(
            text: "Đăng xuất",
            icon: IconAppConstants.icLogout,
            onPressed: () => context.confirmLogoutDialog(),
          ),
          Setting(
            text: "Xoá tài khoản",
            icon: IconAppConstants.icDelete,
            onPressed: () => context.confirmDeleteAccount(userId: user!.id!),
          ),
          Setting(
            text: "Cập nhật app",
            icon: IconAppConstants.icVersion,
            onPressed: () => context.read<AppCubit>().getAppVersion(
                  type: osType,
                  isProduction: true,
                ),
          ),
        ]
      ];
}
