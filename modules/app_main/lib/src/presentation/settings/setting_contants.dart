import 'package:app_main/src/presentation/marshop/marshop_coordintor.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
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

  static List<Setting> session1Menus(BuildContext context) => [
        Setting(
          text: "Đăng ký và nâng cấp tài khoản",
          icon: IconAppConstants.icECommerce,
          onPressed: () => context.startUpgradeMarshop(),
        ),
        Setting(
          text: "Đăng ký JA",
          icon: IconAppConstants.icChanel,
          onPressed: () => context.startUpgradeJA(),
        ),
        Setting(
          text: "JA contract",
          icon: IconAppConstants.icChanel,
          onPressed: () => context.startContractJA(),
        ),
      ];
}
