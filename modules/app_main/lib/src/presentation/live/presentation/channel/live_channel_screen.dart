import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_size.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_bottom_action.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_channel_header.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_end_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/pip_video_render.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/live_message_input.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_view.dart';
import 'package:app_main/src/presentation/live/presentation/pk/live_pk_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'widget/sent_gift_page.dart';
import 'widget/video_play_virtual.dart';

class LiveChannelScreen extends StatefulWidget {
  const LiveChannelScreen({
    super.key,
    required this.liveID,
    this.fromPip = false,
  });

  final int liveID;
  final bool fromPip;

  static const String routerName = '/live_channel';

  @override
  State<LiveChannelScreen> createState() => LiveChannelScreenState();
}

class LiveChannelScreenState extends State<LiveChannelScreen> {
  late final controller = context.read<LiveChannelController>();
  late final LiveMessageBloc commentController;

  @override
  void initState() {
    commentController = context.read<LiveMessageBloc>();
    if (!widget.fromPip) {
      controller.join(widget.liveID);
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.fromPip && PipHandler.showPip.value) {
        PipHandler.removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (controller.state.value != LiveStreamState.watching) return;
      PipHandler.addOverlay(
        PipView(
          width: SizeConfig.screenWidth * 0.3,
          height: SizeConfig.screenWidth * 0.6,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.black.withOpacity(0.8),
          child: MultiProvider(
            providers: [
              Provider<LiveChannelController>.value(
                value: controller,
              ),
              BlocProvider.value(
                value: commentController,
              ),
            ],
            child: const PipVideoRender(),
          ),
        ),
        controller,
      );
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: controller.liveType.value == LiveChannelType.pk
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.liveType.value == LiveChannelType.pk
              ? const Color(0xff032E49)
              : Colors.black.withOpacity(0.8),
          body: Focus(
            onFocusChange: (value) {
              if (!value) controller.disableMessage();
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                NotificationCenter.post(channel: showOption);
                NotificationCenter.post(channel: liveTap);
              },
              behavior: HitTestBehavior.opaque,
              child: Obx(() {
                if (controller.liveType.value == LiveChannelType.pk) {
                  return const LivePkScreen();
                } else {
                  return const _LiveSimple();
                }
              }),
            ),
          ),
        ),
      );
    });
  }
}

class _LiveSimple extends StatelessWidget {
  const _LiveSimple({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Stack(
      fit: StackFit.expand,
      children: [
        Obx(
          () => controller.virtualInfo.value != null
              ? VideoApp(virtualInfo: controller.info.virtualInfo)
              : const _RtcRender(),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: SafeArea(child: LiveChannelHeader()),
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
        Obx(() {
          if (controller.state.value == LiveStreamState.stop) {
            return const LiveEndScreen();
          }
          return const SizedBox.shrink();
        }),
      ],
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
      if (controller.state.value == LiveStreamState.watching) {
        if (controller.hostInLive) {
          if (controller.me.value.isOwner) {
            return Hero(
              tag: 'render owner',
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: controller.service.engine,
                  canvas: const VideoCanvas(
                    uid: 0,
                    renderMode: RenderModeType.renderModeHidden,
                  ),
                ),
              ),
            );
          }

          return Hero(
            tag: controller.hostID,
            child: AgoraVideoView(
              controller: VideoViewController.remote(
                rtcEngine: controller.service.engine,
                canvas: VideoCanvas(
                  uid: controller.hostID,
                  renderMode: RenderModeType.renderModeHidden,
                  mirrorMode: VideoMirrorModeType.videoMirrorModeEnabled,
                  sourceType: VideoSourceType.videoSourceCamera,
                ),
                connection: RtcConnection(
                  channelId: controller.agora?.channel,
                ),
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
