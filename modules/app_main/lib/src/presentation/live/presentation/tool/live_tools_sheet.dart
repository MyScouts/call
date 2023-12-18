import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_home/live_home_screen.dart';
import 'package:app_main/src/presentation/live/presentation/pk/invite/pk_invite_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveToolsSheet extends StatelessWidget {
  const LiveToolsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(8.0),
      ),
      child: Container(
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
                  'Thanh công cụ',
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
              GridView.count(
                padding: const EdgeInsets.all(16.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 5,
                crossAxisSpacing: 24,
                childAspectRatio: 2 / 3,
                children: [
                  if (controller.info.pk == null)
                    _Item(
                      title: 'Mời DK',
                      icon: Assets.icons_lives_pk.svg(),
                      action: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => const PkInviteScreen(),
                        );
                      },
                    ),
                  _Item(
                    title: 'Thu nhỏ',
                    icon: Assets.icons_lives_zoom_in.svg(),
                    action: () {
                      Navigator.of(context).popUntil(
                        (route) =>
                            route.settings.name == LiveHomeScreen.routeName,
                      );
                    },
                  ),
                  _Item(
                    title: 'Lật camera',
                    icon: Assets.icons_lives_switch_came.svg(),
                    action: controller.switchCamera,
                  ),
                  Obx(() {
                    if (controller.video.value) {
                      return _Item(
                        title: 'Tắt hình',
                        icon: Assets.icons_lives_turn_off_video.svg(),
                        action: controller.enableVideo,
                      );
                    }

                    return _Item(
                      title: 'Bật hình',
                      icon: Assets.icons_lives_turn_on_video.svg(),
                      action: controller.enableVideo,
                    );
                  }),
                  Obx(() {
                    if (controller.video.value) {
                      return _Item(
                        title: 'Tắt Mic',
                        icon: Assets.icons_lives_turn_off_mic.svg(),
                        action: controller.enableAudio,
                      );
                    }

                    return _Item(
                      title: 'Bật Mic',
                      icon: Assets.icons_lives_turn_on_mic.svg(),
                      action: controller.enableVideo,
                    );
                  }),
                  _Item(
                    title: 'Làm đẹp',
                    icon: Assets.icons_lives_beauty.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Bộ lọc',
                    icon: Assets.icons_lives_filter.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Hiệu ứng',
                    icon: Assets.icons_lives_hieuung.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Ghi hình',
                    icon: Assets.icons_lives_record.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Gọi âm thanh',
                    icon: Assets.icons_lives_call.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Gọi video',
                    icon: Assets.icons_lives_call_video.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Tạo live nhóm',
                    icon: Assets.icons_lives_live_group.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Chia sẻ',
                    icon: Assets.icons_lives_share.svg(),
                    action: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
  });

  final Widget icon;
  final String title;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
              color: Color(0xffE8F0FE),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
