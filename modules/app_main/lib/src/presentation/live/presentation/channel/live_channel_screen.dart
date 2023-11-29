import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_bottom_action.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_channel_header.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_loading_screen.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/live_message_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/sent_gift_page.dart';

class LiveChannelScreen extends StatefulWidget {
  const LiveChannelScreen({super.key, required this.liveID});

  final int liveID;

  static const String routerName = '/live_channel';

  @override
  State<LiveChannelScreen> createState() => LiveChannelScreenState();
}

class LiveChannelScreenState extends State<LiveChannelScreen> {
  late final controller = context.read<LiveChannelController>();

  @override
  void initState() {
    controller.join(widget.liveID);
    super.initState();
  }

  @override
  void dispose() {
    controller.leaveLive();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Focus(
        onFocusChange: (value) {
          if (!value) controller.disableMessage();
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          behavior: HitTestBehavior.opaque,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const _RtcRender(),
              const Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: LiveChannelHeader(),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: LiveBottomAction(),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: SentGiftPage(
                    provider: controller.floatingGiftsProvider,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Obx(() {
                  if (controller.showMessageInput.value) {
                    return const LiveMessageInput();
                  }
                  return const SizedBox.shrink();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RtcRender extends StatefulWidget {
  const _RtcRender({super.key});

  @override
  State<_RtcRender> createState() => _RtcRenderState();
}

class _RtcRenderState extends State<_RtcRender> {
  LiveDataProvider? provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = context.findAncestorWidgetOfExactType<LiveDataProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Obx(() {
      if (controller.state.value == LiveStreamState.stop) {
        return const Center(
          child: Text(
            'Live đã kết thúc',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        );
      }
      if (controller.state.value == LiveStreamState.watching) {
        if (controller.hostInLive) {
          if (controller.me.value.isOwner) {
            return AgoraVideoView(
              controller: VideoViewController(
                rtcEngine: controller.service.engine,
                canvas: const VideoCanvas(
                  uid: 0,
                  renderMode: RenderModeType.renderModeHidden,
                ),
              ),
            );
          }

          return AgoraVideoView(
            controller: VideoViewController(
              rtcEngine: controller.service.engine,
              canvas: VideoCanvas(
                uid: controller.hostID,
                renderMode: RenderModeType.renderModeHidden,
                mirrorMode: VideoMirrorModeType.videoMirrorModeEnabled,
                sourceType: VideoSourceType.videoSourceCamera,
              ),
            ),
          );
        }

        return const Center(
          child: Text(
            'Đợi chủ phòng xíu nhé',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        );
      }

      return SizedBox.expand(
        child: Obx(() {
          if (controller.roomInfoFetching.value) {
            return const Center(child: PlatformLoadingIndicator());
          }
          return CachedNetworkImage(
            imageUrl: controller.info.medias.first.link,
            fit: BoxFit.cover,
          );
        }),
      );
    });
  }
}
