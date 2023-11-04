import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/settings/setting_constants.dart';
import 'package:app_main/src/presentation/settings/widget/item_setting_widget.dart';
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
  late final userCubit = context.read<UserCubit>();
  late User _authInfo;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
  }

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
                    const SizedBox(height: 10),
                    _buildSession1(),
                    const SizedBox(height: 10),
                    _buildSessionMenus(),
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

  _buildSessionMenus() {
    return Column(
      children: Setting.session1Menus(context, user: userCubit.currentUser)
          .map((settings) => _buildMenus(settings))
          .toList(),
    );
  }

  _buildSession1() {
    return ItemSettingWidget(
      title: "Hồ sơ tài khoản",
      name: _authInfo.email,
      summary: "ID: ${_authInfo.pDoneId}",
      avatar: "avatar",
    );
  }

  Widget _buildMenus(List<Setting> settings) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: settings.map((menu) {
          final index = settings.indexOf(menu);
          return ItemSettingWidget(
            name: menu.text,
            icon: menu.icon,
            onPressed: menu.onPressed,
            border: BorderRadius.only(
              topLeft: Radius.circular(index == 0 ? 10 : 0),
              topRight: Radius.circular(index == 0 ? 10 : 0),
              bottomLeft:
                  Radius.circular(index == settings.length - 1 ? 10 : 0),
              bottomRight:
                  Radius.circular(index == settings.length - 1 ? 10 : 0),
            ),
          );
        }).toList(),
      ),
    );
  }
}
