import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/settings/setting_contants.dart';
import 'package:app_main/src/presentation/settings/widget/item_setting_widget.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "settings";
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      backgroundColor: const Color(0xFFF2F2F6),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.setting.capitalize(),
                      style: context.text.titleLarge!.copyWith(
                        fontSize: 24,
                        height: 1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    _buildSearch(),
                    _buildMenus(),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _buildSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: context.text.bodySmall!.copyWith(color: AppColors.grey20),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ImageWidget(
              IconAppConstants.icSearch,
              color: AppColors.black,
              fit: BoxFit.cover,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 30),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          hintText: "Tìm kiếm",
          hintStyle: context.text.bodySmall!.copyWith(color: AppColors.grey20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.grey5,
        ),
      ),
    );
  }

  _buildMenus() {
    return Column(
      children: [
        _buildSession1(),
        const SizedBox(height: 10),
        _buildSession2(),
      ],
    );
  }

  _buildSession1() {
    return const ItemSettingWidget(
      title: "Hồ sơ tài khoản",
      name: "Thanh Nguyễn",
      summary: "ID: VN4444406541234",
      avatar: "avatar",
    );
  }

  _buildSession2() {
    return Column(
      children: Setting.session1Menus(context)
          .map((item) => ItemSettingWidget(
                name: item.text,
                icon: item.icon,
                onPressed: item.onPressed,
              ))
          .toList(),
    );
  }
}
