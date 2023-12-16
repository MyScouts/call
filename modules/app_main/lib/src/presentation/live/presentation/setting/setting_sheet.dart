import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  if (!controller.me.value.isOwner)
                    _Item(
                      icon: Assets.icons_lives_gift_flash.svg(),
                      title: 'Cài đặt quà tặng nhanh',
                      action: () {},
                    ),
                  if (controller.me.value.isOwner)
                    _Item(
                      icon: Assets.icons_lives_admin_setting.svg(),
                      title: 'Cài đặt admin quản lý  phòng live',
                      action: () {},
                    ),
                  if (controller.me.value.isOwner)
                    _Item(
                      icon: Assets.icons_lives_edit_setting.svg(),
                      title: 'Sửa live',
                      action: () {},
                    ),
                ],
              )
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff6E6E6E),
                  height: 1.2,
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: SizedBox.square(
                dimension: 24,
                child: Assets.icons_lives_chevron_down.svg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
