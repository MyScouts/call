import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/app/app_cubit.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/settings/setting_constants.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/confirm_register_ja_response.dart';
import 'package:app_main/src/data/models/responses/ja_status_response.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
import 'package:app_main/src/presentation/settings/widget/item_setting_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "settings";

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final userCubit = context.read<UserCubit>();
  late User _authInfo;
  OnBoarding? _onboarding;
  PackageInfo? currentPackageInfo;
  User? _userPublicInfo;

  @override
  void initState() {
    super.initState();
    _authInfo = userCubit.currentUser!;
    userCubit.getOnboarding();
    userCubit.getUserPublicInfo(userCubit.currentUser!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      appBar: const BaseAppBar(title: "Tài khoản"),
      backgroundColor: const Color(0XFFF3F8FF),
      body: MultiBlocListener(
        listeners: [
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
                Future.delayed(const Duration(milliseconds: 200)).then((value) {
                  setState(() {});
                });
                userCubit.fetchUser();
              }
              if (state is GetUserPublicInfoSuccess) {
                _userPublicInfo = state.user;
                Future.delayed(const Duration(milliseconds: 200)).then((value) {
                  setState(() {});
                });
              }
            },
          ),
          BlocListener<AppCubit, AppState>(
            listener: (context, state) {
              if (state is LoadingAppVersion) {
                showLoading();
              } else {
                hideLoading();
              }

              currentPackageInfo = switch (state) {
                (UpgradeAppVersion s) => s.currentPackageInfo,
                (OptionalUpgradeAppVersion s) => s.currentPackageInfo,
                (LatestAppVersion s) => s.currentPackageInfo,
                _ => null,
              };

              switch (state) {
                case OptionalUpgradeAppVersion(version: final version):
                  context.updateOptionalAppVersion(
                    version: version,
                    onUpdateAppVersion: () => _handleUpgrade(),
                  );
                  break;
                case LatestAppVersion():
                  context.confirmLatestAppVersion();
                  break;
                case UpgradeAppVersion():
                  context.showForceUpgradeAppDialog();
                  break;
                default:
                  break;
              }
            },
          ),
        ],
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
                  // _buildSearch(),
                  const SizedBox(height: 10),
                  _buildSessionMenus(),
                  _buildVersion(),
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
    return Column(
      children: Setting.session1Menus(
        context,
        user: userCubit.currentUser,
        onUpdate: () => userCubit.getOnboarding(),
        onboarding: _onboarding,
        osType: currentPlatformName,
        isProduction: Configurations.isProduction,
      ).map((settings) => _buildMenus(settings)).toList(),
    );
  }

  _buildSession1() {
    return GestureDetector(
      onTap: () => {},
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
            BlocBuilder<UserCubit, UserState>(
              builder: (_, state) {
                return AppAvatarWidget(
                  avatar: userCubit.currentUser?.avatar,
                  width: 50,
                  height: 50,
                  defaultAvatar: ImageConstants.defaultUserAvatar,
                  isPDone: _onboarding?.isPdone ?? false,
                );
              },
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _authInfo.getDisplayName,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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

  Widget _buildVersion() {
    return FutureBuilder<PackageInfo>(
      future: DeviceService.getPackageInfo(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const SizedBox.shrink();
        }
        final version = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Phiên bản: ${version.version}',
                style: context.textTheme.titleSmall,
              ),
              if (!Configurations.isProduction) const SizedBox(width: 5),
              if (!Configurations.isProduction)
                Text(
                  '(${version.buildNumber})',
                  style: context.textTheme.titleSmall,
                ),
            ],
          ),
        );
      },
    );
  }

  void _handleUpgrade() {
    if (Platform.isAndroid || Platform.isIOS) {
      final appId = Platform.isAndroid
          ? Configurations.androidPackageId
          : Configurations.iosAppId;
      final url = Uri.parse(
        Platform.isAndroid
            ? "market://details?id=$appId"
            : "https://apps.apple.com/app/id$appId",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
