import 'package:app_core/app_core.dart';
import 'package:app_main/app_main.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

class StatusBarWidget extends StatelessWidget {
  final Function() openAppStore;
  final Function() openNotification;
  final Function()? onCanceled;
  final bool enableEditMode;

  bool get authenticate => isAuthenticate.value;

  const StatusBarWidget(
      {super.key,
      required this.openAppStore,
      required this.openNotification,
      this.enableEditMode = false,
      this.onCanceled});

  @override
  Widget build(BuildContext context) {
    if (enableEditMode) {
      return SizedBox(
        height: 35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (!authenticate) {
                    context.requiredLogin();
                    return;
                  }
                  context.showAppStore();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              TextButton(
                onPressed: onCanceled,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: const Text(
                  'Xong',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        if (!authenticate) {
          context.requiredLogin();
          return;
        }
        context.startSearch();
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 35),
        padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (!authenticate) {
                    context.requiredLogin();
                    return;
                  }
                  context.startSetting();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (_, state) {
                      if(state.currentUser?.avatar?.trim().isEmpty ?? false) {
                        return  Container(
                          height: 40,
                          width: 40,
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
                        );
                      }
                      return AspectRatio(
                        aspectRatio: 1,
                        child: CircleNetworkImage(
                          url: context.read<UserCubit>().currentUser?.avatar ?? '',
                          size: 40,
                          defaultImage: ImageWidget(
                            ImageConstants.defaultUserAvatar,
                            borderRadius: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      ImageWidget(
                        IconAppConstants.icSearch,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        S.current.search.capitalize(),
                        style: context.text.bodyMedium!.copyWith(
                          color: Colors.white.withOpacity(.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: openNotification,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox.square(
                    dimension: 24,
                    child: ImageWidget(
                      IconAppConstants.bell,
                      color: Colors.white,
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
                  openAppStore();
                },
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox.square(
                    dimension: 24,
                    child: ImageWidget(
                      IconAppConstants.icHamburger,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
