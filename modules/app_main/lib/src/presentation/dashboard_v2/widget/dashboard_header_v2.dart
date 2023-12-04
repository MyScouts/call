import 'package:app_core/app_core.dart';
import 'package:app_main/app_main.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

class DashBoardV2Header extends StatelessWidget {
  const DashBoardV2Header({
    super.key,
    required this.onNotification,
    required this.openAppStore,
    required this.openSetting,
  });

  final Function() onNotification;
  final Function() openAppStore;
  final Function() openSetting;

  bool get authenticate => isAuthenticate.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        color: Colors.white,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        bottom: false,
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              BlocBuilder<UserCubit, UserState>(
                builder: (_, state) {
                  return AspectRatio(
                    aspectRatio: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (!authenticate) {
                          context.requiredLogin();
                          return;
                        }
                        context.startSetting();
                      },
                      behavior: HitTestBehavior.opaque,
                      child: CircleNetworkImage(
                        url:
                            context.read<UserCubit>().currentUser?.avatar ?? '',
                        size: 40,
                        defaultImage: ImageWidget(
                          ImageConstants.defaultUserAvatar,
                          borderRadius: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (!authenticate) {
                      context.requiredLogin();
                      return;
                    }
                    context.startSearch();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F9FF),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ImageWidget(
                          IconAppConstants.icSearch,
                          color: const Color(0xff667385),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Tìm kiếm',
                          style: TextStyle(
                            color: Color(0xff667385),
                            fontSize: 14,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!authenticate) {
                    context.requiredLogin();
                    return;
                  }
                  onNotification.call();
                },
                behavior: HitTestBehavior.opaque,
                child: _Item(icon: Assets.icons_dashboard_notification.path),
              ),
              GestureDetector(
                onTap: () {
                  if (!authenticate) {
                    context.requiredLogin();
                    return;
                  }
                  openSetting.call();
                },
                behavior: HitTestBehavior.opaque,
                child: _Item(icon: Assets.icons_dashboard_setting.path),
              ),
              GestureDetector(
                onTap: () {
                  if (!authenticate) {
                    context.requiredLogin();
                    return;
                  }
                  openAppStore.call();
                },
                behavior: HitTestBehavior.opaque,
                child: _Item(icon: Assets.icons_dashboard_ic_menu.path),
              ),
            ].separated(const SizedBox(width: 8)),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xffF6F9FF),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ImageWidget(icon),
      ),
    );
  }
}
