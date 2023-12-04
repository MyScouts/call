import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingSheet extends StatelessWidget {
  const SettingSheet({super.key});

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
                  'Cài đặt livestream',
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
                          color: Theme
                              .of(context)
                              .primaryColor,
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
                  Obx(() {
                    final action = controller.enableAudio;
                    if(controller.mic.value) {
                      return _Item(
                        title: 'Gọi âm thanh',
                        icon: Assets.icons_lives_micro.svg(),
                        action: action,
                      );
                    }

                    return _Item(
                      title: 'Gọi âm thanh',
                      icon: Assets.icons_lives_micro.svg(),
                      action: action,
                    );
                  }),
                  Obx(() {
                    final action = controller.enableVideo;
                    if(controller.mic.value) {
                      return  _Item(
                        title: 'Gọi video',
                        icon: Assets.icons_lives_video.svg(),
                        action: action,
                      );
                    }

                    return  _Item(
                      title: 'Gọi video',
                      icon: Assets.icons_lives_video.svg(),
                      action: action,
                    );
                  }),
                  _Item(
                    title: 'Filter',
                    icon: Assets.icons_lives_filter.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Quà tặng nhanh',
                    icon: Assets.icons_lives_gift_1.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Sửa tiêu đề',
                    icon: Assets.icons_lives_edit.svg(),
                    action: () {},
                  ),
                  _Item(
                    title: 'Sửa chế độ',
                    icon: Assets.icons_lives_public.svg(),
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
    return Column(
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
    );
  }
}
