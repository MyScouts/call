import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/marshop/marshop_coordintor.dart';
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

  static List<Setting> session1Menus(BuildContext context, {User? user}) => [
        Setting(
          text: "Đăng ký và nâng cấp tài khoản",
          icon: IconAppConstants.icECommerce,
          onPressed: () => context.startUpgradeMarshop(),
        ),
        // Setting(
        //   text: "JA contract",
        //   icon: IconAppConstants.icChanel,
        //   onPressed: () => context.startUpgradeJAFlow(user),
        // ),
      ];
}
