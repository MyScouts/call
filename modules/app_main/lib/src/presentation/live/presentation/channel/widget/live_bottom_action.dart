import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_reaction/live_reaction_screen.dart';
import 'package:app_main/src/presentation/live/presentation/setting/setting_sheet.dart';
import 'package:app_main/src/presentation/live/presentation/tool/live_tools_sheet.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:provider/provider.dart';

import 'live_button_action.dart';
import '../../live_message/live_comment_widget.dart';
import 'live_gift_button.dart';
import 'live_rose_button.dart';

class LiveBottomAction extends StatelessWidget {
  const LiveBottomAction({super.key});

  void liveSetting(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<LiveChannelController>(),
        child: const SettingSheet(),
      ),
    );
  }

  void liveTool(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<LiveChannelController>(),
        child: const LiveToolsSheet(),
      ),
    );
  }

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
                Obx(() {
                  return SizedBox(
                    height: controller.liveType.value == LiveChannelType.pk
                        ? 194.h
                        : ScreenUtil().screenHeight * 0.6,
                    child: Row(
                      children: [
                        const Expanded(child: LiveCommentWidget()),
                        SizedBox(
                          width: 104.w,
                          child: GestureDetector(
                            onDoubleTap: controller.reaction,
                            behavior: HitTestBehavior.opaque,
                            child: const LiveReactionScreen(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                Obx(() {
                  final controller = context.read<LiveChannelController>();
                  return Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            LiveButtonAction(
                              icon: ImageWidget(
                                IconAppConstants.icLiveMarshop,
                              ),
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
                                onPressed: () {
                                  context.showBottomSheetLive(controller,
                                      index: 1);
                                },
                              ),
                            if (controller.me.value.isOwner)
                              LiveButtonAction(
                                icon: ImageWidget(
                                  IconAppConstants.icLiveSetting,
                                ),
                                onPressed: () => liveSetting(context),
                              ),
                            if (controller.me.value.isOwner)
                              LiveButtonAction(
                                bgColor: const Color(0xff4B84F7),
                                icon: ImageWidget(IconAppConstants.icLiveQr),
                                onPressed: () {
                                  liveTool(context);
                                },
                              ),
                            if (!controller.me.value.isOwner)
                              LiveButtonAction(
                                icon: ImageWidget(
                                  IconAppConstants.icLiveMenu,
                                ),
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
