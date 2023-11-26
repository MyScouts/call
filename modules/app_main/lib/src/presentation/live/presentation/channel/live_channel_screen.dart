import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_bottom_action.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_channel_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveChannelScreen extends StatefulWidget {
  const LiveChannelScreen({super.key, required this.liveID});

  final int liveID;

  static const String routerName = '/live_channel';

  @override
  State<LiveChannelScreen> createState() => LiveChannelScreenState();
}

class LiveChannelScreenState extends State<LiveChannelScreen> {
  late final controller = getIt<LiveChannelController>();

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
    return const Material(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _RtcRender(),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: LiveChannelHeader(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LiveBottomAction(),
          ),
        ],
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
    final controller = context.findAncestorStateOfType<LiveChannelScreenState>()!.controller;

    if (provider != null) {
      return AgoraVideoView(
        key: const Key('render preview'),
        controller: VideoViewController(
          rtcEngine: provider!.controller.service.engine,
          canvas: const VideoCanvas(
            uid: 0,
            renderMode: RenderModeType.renderModeHidden,
          ),
        ),
      );
    }

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

        return Center(
          child: GestureDetector(
            onTap: () {
              context.showBottomGift(controller);
              //context.showBottomSheetLive(controller);
            },
            child: const Text(
              'Đợi chủ phòng xíu nhé',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        );
      }

      return const Center(child: PlatformLoadingIndicator());
    });
  }
}
