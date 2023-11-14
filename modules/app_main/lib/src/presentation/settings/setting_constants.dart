import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:app_main/src/presentation/community/community.component.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:app_main/src/presentation/protector/manage_protector_screen.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
import 'package:app_main/src/presentation/shared/user/bloc/user_bloc.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

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
    OnboardingResponse? onboarding,
  }) =>
      [
        [
          Setting(
            text: "Cài đặt tài khoản",
            icon: IconAppConstants.icSettingAccount,
          ),
          if ((user?.old ?? 0) >= 18)
            Setting(
              text: "Quản lý người bảo hộ",
              icon: IconAppConstants.icCare,
              onPressed: () {
                Navigator.pushNamed(context, ManageProtectorScreen.routerName);
              },
            ),
          Setting(
            text: "Tin nhắn office",
            icon: IconAppConstants.icChat,
          ),
        ],
        [
          Setting(
            text: "Team",
            icon: IconAppConstants.icTeamProfile,
            onPressed: () =>
                Navigator.pushNamed(context, CommunityWidget.routeName),
          ),
          Setting(
            text: "PDone",
            icon: IconAppConstants.icUpgrade,
            onPressed: () => context.startUpgradePDone(),
          ),
          Setting(
            text: "JA",
            icon: IconAppConstants.icJA,
            onPressed: () {
              final bloc = context.read<GetJAStatusBloc>();
              bloc.add(GetDetailDataEvent());
            },
          ),
          Setting(
            text: "Khách hàng thường xuyên - Market Home",
            icon: IconAppConstants.icMarshopHome,
            onPressed: () {
              if (onboarding != null && onboarding.isMarshopCustomer) {
                context.showToastMessage("Bạn đã là khách hàng thường xuyên.");
                return;
              }
              context.startRegisterCustomer();
            },
          ),
          Setting(
            text: "Tài khoản Marshop",
            icon: IconAppConstants.icMarshop,
            onPressed: () {
              if (onboarding != null && !onboarding.isJA) {
                context.confirmUpgradeJA(
                  onConfirm: () {
                    final bloc = context.read<GetJAStatusBloc>();
                    bloc.add(GetDetailDataEvent());
                  },
                );
                return;
              }
              context.startRegisterMarshop();
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
        ]
      ];
}
