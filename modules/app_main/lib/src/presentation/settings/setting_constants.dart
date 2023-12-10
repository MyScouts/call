import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/app/app_cubit.dart';
import 'package:app_main/src/presentation/community/community.component.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/system_setting.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordinator.dart';
import 'package:app_main/src/presentation/profile/user_profile_screen.dart';
import 'package:app_main/src/presentation/protector/manage_protector_screen.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
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
    OnBoarding? onboarding,
    required Function() onUpdate,
    required String osType,
    required bool isProduction,
  }) =>
      [
        [
          Setting(
            text: "Cài đặt chung",
            icon: IconAppConstants.icSettingHome,
            onPressed: () =>
                Navigator.of(context).pushNamed(SystemSetting.routerName),
          ),
        ],
        [
          Setting(
            text: "Cài đặt tài khoản",
            icon: IconAppConstants.icSettingAccount,
            onPressed: () =>
                Navigator.of(context).pushNamed(UserProfileScreen.routerName),
          ),
          if ((user?.getAge ?? 0) >= 18)
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
            icon: Assets.icons_ic_team_png.path,
            onPressed: () =>
                Navigator.pushNamed(context, CommunityWidget.routeName),
          ),
          Setting(
              text: "P-Done",
              icon: IconAppConstants.icUpgrade,
              onPressed: () {
                print('onboarding?.isPdone : ${onboarding?.isPdone}');
                if (onboarding?.isPdone ?? false) {
                  context.startPDoneInformation().then((value) => onUpdate());
                } else {
                  context.startUpgradePDone().then((value) => onUpdate());
                }
              }),
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
            onPressed: context.startRegisterCustomer,
          ),
          Setting(
            text: "Tài khoản MarShop",
            icon: IconAppConstants.icMarshop,
            onPressed: context.startRegisterMarshop,
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
                  isProduction: isProduction,
                ),
          ),
        ]
      ];
}
