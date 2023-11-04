import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordintor.dart';
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

  static List<List<Setting>> session1Menus(BuildContext context,
          {User? user}) =>
      [
        [
          Setting(
            text: "Đăng ký khách hàng thường xuyên",
            icon: IconAppConstants.icECommerce,
            onPressed: () => context.startRegisterCustomer(),
          ),
          Setting(
            text: "Nâng cấp P-DONE",
            icon: IconAppConstants.icVDone,
            onPressed: () => context.startUpgradePDone(),
          ),
          Setting(
            text: "JA contract",
            icon: IconAppConstants.icChanel,
            onPressed: () {
              final bloc = context.read<GetJAStatusBloc>();
              bloc.add(GetDetailDataEvent());
            },
          ),
        ],
        [
          Setting(
            text: "Đăng xuất",
            icon: IconAppConstants.icLogout,
            onPressed: () => context.confirmLogoutDialog(),
          ),
        ]
      ];
}
