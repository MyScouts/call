import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/information_profile/screens/information_profile_screen.dart';
import 'package:app_main/src/presentation/settings/setting_constants.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/presentation/settings/widget/item_setting_widget.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_account_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
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
  late User _authInfo;
  OnboardingResponse? _onboarding;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
    userCubit.onboarding();
    userCubit.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      appBar: const BaseAppBar(title: "Tài khoản"),
      backgroundColor: const Color(0XFFF3F8FF),
      body: MultiBlocListener(
        listeners: [
          BlocListener<GetJAStatusBloc, GetDetailState>(
            listener: _onListenerGetJAStatusBloc,
          ),
          BlocListener<UserCubit, UserState>(
            listener: (context, state) {
              if (state is OnboardingFail) {
                showToastMessage("Lỗi hệ thống, vui lòng thử lại sau.",
                    ToastMessageType.warning);
                context.startDashboardUtil();
                return;
              }
              if (state is OnboardingSuccess) {
                _onboarding = state.onboarding;
              }
            },
          ),
        ],
        child: BlocListener<ConfirmRegisterJABloc, GetDetailState>(
          listener: _onListenerConfirmJABloc,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSession1(),
                    const SizedBox(height: 10),
                    _buildSearch(),
                    const SizedBox(height: 10),
                    _buildSessionMenus(),
                  ],
                ),
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
        user: userCubit.currentUser?.copyWith(
          isJA: _onboarding?.isJA,
          isPDone: _onboarding?.isPdone,
        ),
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: context.text.bodySmall!.copyWith(color: AppColors.grey20),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ImageWidget(
              IconAppConstants.icSearch,
              color: Colors.grey,
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
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  _buildSessionMenus() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Column(
          children: Setting.session1Menus(
            context,
            user: userCubit.currentUser,
            onUpdate: () {
              userCubit.onboarding();
            },
            onboarding: state is OnboardingSuccess ? state.onboarding : null,
          ).map((settings) => _buildMenus(settings)).toList(),
        );
      },
    );
  }

  _buildSession1() {
    return GestureDetector(
      // onTap: () => context.startDiary(userId: _authInfo.id.toString()),
      onTap: () => Navigator.of(context).push(_createRoute()),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.theme.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(90),
              ),
              child: ClipRRect(
                child: ImageWidget(
                  ImageConstants.defaultUserAvatar,
                  borderRadius: 100,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _authInfo.getdisplayName,
                      style: context.textTheme.titleMedium!.copyWith(
                        fontSize: 15,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (_authInfo.isPDone!)
                      Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: context.theme.primaryColor,
                        ),
                        child: Text(
                          "P",
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: AppColors.white,
                            height: 0,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    if (_authInfo.isJA ?? false)
                      Container(
                        height: 18,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: context.theme.colorScheme.secondary,
                        ),
                        child: Text(
                          "JA",
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: AppColors.white,
                            height: 0,
                            fontSize: 11,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  "ID: ${_authInfo.pDoneId}",
                  style: context.textTheme.titleMedium!.copyWith(
                    fontSize: 13,
                    color: AppColors.grey14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const InformationProfileScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
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
            hasBorder: index < settings.length - 1,
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
