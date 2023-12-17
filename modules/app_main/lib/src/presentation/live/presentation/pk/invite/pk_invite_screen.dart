import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/presentation/pk/invite/pk_invite_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PkInviteScreen extends StatefulWidget {
  const PkInviteScreen({super.key});

  @override
  State<PkInviteScreen> createState() => _PkInviteScreenState();
}

class _PkInviteScreenState extends State<PkInviteScreen> {
  late final controller = getIt<PkInviteController>();
  late final uid = context.read<UserCubit>().currentUser?.id ?? 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(8.0),
      ),
      child: Container(
        height: ScreenUtil().screenHeight * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                leading: const CloseButton(),
                centerTitle: true,
                title: const Text(
                  'Mời DK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Xong',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextFormField(
                  cursorHeight: 20,
                  cursorColor: const Color(0xff8C8C8C),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm',
                    hintStyle: const TextStyle(
                      color: Color(0xff8C8C8C),
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.zero,
                    fillColor: const Color(0xffFAFAFA),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16),
                        Assets.icons_lives_search.svg(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Danh sách bạn bè đang livestream',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff8C8C8C),
                        height: 1.2,
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    //   child: const Text(
                    //     'Mời tất cả',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       color: Color(0xff4B84F7),
                    //       fontWeight: FontWeight.w500,
                    //       height: 1.2,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.loading.value) {
                    return const Center(child: PlatformLoadingIndicator());
                  }

                  return SmartRefresher(
                    controller: controller.controller,
                    enablePullDown: true,
                    enablePullUp: controller.hasMore.value,
                    onRefresh: controller.refresh,
                    onLoading: controller.loadMore,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Column(
                          children: controller.items.value
                              .where((e) => e.user!.id != uid)
                              .map<Widget>((e) {
                                return Obx(() => _Card(
                                      user: e.user ?? const User(),
                                      onInvite: () {
                                        controller.invite(e.user!.id ?? 0);
                                      },
                                      isInvited: controller.invites.value
                                          .contains(e.user!.id),
                                    ));
                              })
                              .toList()
                              .separated(const SizedBox(height: 20)),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.user,
    required this.onInvite,
    this.isInvited = false,
  });

  final User user;
  final Function() onInvite;
  final bool isInvited;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleNetworkImage(
          url: user.avatar ?? '',
          size: 36,
          defaultImage: ImageWidget(
            ImageConstants.defaultUserAvatar,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          user.nickname ?? user.fullName ?? user.displayName ?? '',
          style: const TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        if (!isInvited)
          SizedBox(
            height: 30,
            child: TextButton(
              onPressed: onInvite,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                backgroundColor: const Color(0xff4B84F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Mời',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          )
        else
          const Text(
            'Đã mời',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff6E6E6E),
            ),
          ),
      ],
    );
  }
}
