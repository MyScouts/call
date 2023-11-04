import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/presentation/settings/setting_contants.dart';
import 'package:app_main/src/presentation/settings/widget/item_setting_widget.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "settings";

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final userCubit = context.read<UserCubit>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      backgroundColor: const Color(0xFFF2F2F6),
      body: BlocListener<GetJAStatusBloc, GetDetailState>(
        listener: _onListenerGetJAStatusBloc,
        child: BlocListener<ConfirmRegisterJABloc, GetDetailState>(
          listener: _onListenerConfirmJABloc,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
              ),
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
        ),
      ),
    );
  }

  void _onListenerGetJAStatusBloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataLoading) {
      showLoading();
    } else if (state is GetDetailDataSuccess<JAStatusResponse>) {
      hideLoading();
      context.startUpgradeJAFlow(
        jaStatus: state.data.jaInfo,
        user: userCubit.currentUser,
      );
    } else if (state is GetDetailError) {
      hideLoading();
      final e = state.error;
      if (e is DioError) {
        final message = e.toMessage(context);
        showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Đã có lỗi xảy ra, vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        showToastMessage(message, ToastMessageType.error);
      }
    }
  }

  void _onListenerConfirmJABloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataSuccess<ConfirmRegisterJAResponse>) {
      // if (state.data.result == true) {
      //   showToastMessage(
      //     'Bạn đã đăng ký JA thành công!',
      //     ToastMessageType.success,
      //   );
      // } else {
      //   showToastMessage(
      //     'Bạn đã huỷ đăng ký JA!',
      //     ToastMessageType.success,
      //   );
      // }
    } else if (state is GetDetailError) {
      final e = state.error;
      if (e is DioError) {
        final message = e.toMessage(context);
        showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Đã có lỗi xảy ra, vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        showToastMessage(message, ToastMessageType.error);
      }
    }
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
    return const ItemSettingWidget(
      title: "Hồ sơ tài khoản",
      name: "Thanh Nguyễn",
      summary: "ID: VN4444406541234",
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
