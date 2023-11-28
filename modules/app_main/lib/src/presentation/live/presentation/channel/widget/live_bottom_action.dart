import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_reaction/live_reaction_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';

import 'live_button_action.dart';
import '../../live_message/live_comment_widget.dart';
import 'live_gift_button.dart';
import 'live_rose_button.dart';

class LiveBottomAction extends StatelessWidget {
  const LiveBottomAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = context.read<LiveChannelController>();

      if (controller.state.value == LiveStreamState.watching) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          children: [
                            Expanded(child: LiveCommentWidget()),
                            _ActionBan(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: GestureDetector(
                          onDoubleTap: controller.reaction,
                          behavior: HitTestBehavior.opaque,
                          child: const LiveReactionScreen(),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  final controller = context.read<LiveChannelController>();
                  return Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            if (controller.me.value.isOwner)
                              LiveButtonAction(
                                icon:
                                    ImageWidget(IconAppConstants.icLiveMarshop),
                                onPressed: () {},
                              ),
                            LiveButtonAction(
                              icon: ImageWidget(IconAppConstants.icLiveComment),
                              onPressed: controller.enableMessage,
                            ),
                            if (controller.me.value.isOwner)
                              LiveButtonAction(
                                icon: ImageWidget(IconAppConstants.icLiveShare),
                                onPressed: () {},
                              ),
                            if (!controller.me.value.isOwner)
                              LiveButtonAction(
                                icon: ImageWidget(IconAppConstants.icLive2User),
                                onPressed: () {},
                              ),
                            if (controller.me.value.isOwner)
                              LiveButtonAction(
                                icon:
                                    ImageWidget(IconAppConstants.icLiveSetting),
                                onPressed: () {},
                              ),
                            if (controller.me.value.isOwner)
                              LiveButtonAction(
                                bgColor: const Color(0xff4B84F7),
                                icon: ImageWidget(IconAppConstants.icLiveQr),
                                onPressed: () {},
                              ),
                            if (!controller.me.value.isOwner)
                              LiveButtonAction(
                                icon: ImageWidget(IconAppConstants.icLiveMenu),
                                onPressed: () {},
                              ),
                            const Spacer(),
                            if (!controller.me.value.isOwner)
                              const LiveRoseButton(),
                          ].separated(const SizedBox(width: 10)),
                        ),
                      ),
                      if (!controller.me.value.isOwner) const LiveGiftButton(),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class _ActionBan extends StatelessWidget {
  const _ActionBan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(
          'Nghiêm cấm tất cả các nội dung không lành'
          ' mạnh, thô tục, tình dục (bao gồm tình dục'
          ' trẻ em), trái với thuần phong mỹ tục;'
          ' các nội dụng liên quan đến chống phá'
          ' nhà nước, vi phamj bản quyền hoặc pháp'
          ' luật trong phòng live. Nếu vi phạm,'
          ' VDONE sẽ tạm ngưng hoặc xóa tài khoản'
          ' của bạn.',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xffB6B5BA),
          ),
        ),
      ),
    );
  }
}
