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
import 'package:app_main/src/presentation/live/presentation/live_message/live_opacity_builder.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'widget/sent_gift_page.dart';

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
      controller.join(widget.liveID, context);
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
              BlocProvider<LiveMessageBloc>.value(
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
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: controller.enablePk.value
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
            },
            behavior: HitTestBehavior.opaque,
            child: Obx(() {
              if (controller.enablePk.value) {
                return const _LivePk();
              } else {
                return const _LiveSimple();
              }
            }),
          ),
        ),
      );
    });
  }
}

class _LivePk extends StatelessWidget {
  const _LivePk({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Stack(
      fit: StackFit.expand,
      children: [
        const SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: OpacityBuilder(
                  key: Key('pk live'),
                  child: LiveChannelHeader(),
                ),
              ),
              SizedBox(height: 16),
              _LivePKRtc(),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: OpacityBuilder(
            key: Key('pk live'),
            child: LiveBottomAction(),
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
    );
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
        const _RtcRender(),
        const Align(
          alignment: Alignment.topCenter,
          child: OpacityBuilder(
            key: Key('live simple'),
            child: SafeArea(child: LiveChannelHeader()),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: OpacityBuilder(
            child: LiveBottomAction(),
          ),
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

class _LivePKRtc extends StatelessWidget {
  const _LivePKRtc({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    if (controller.info.pk == null) return const SizedBox.shrink();

    final meInLive = controller.pkData!.lives.firstWhereOrNull(
            (e) => e.user!.id == controller.me.value.info.userID) !=
        null;

    Widget left;
    Widget right;

    if (meInLive) {
      final host = controller.pkData!.lives.firstWhereOrNull(
          (e) => e.user!.id != controller.me.value.info.userID);
      left = AnimatedSize(
        duration: const Duration(milliseconds: 150),
        child: AgoraVideoView(
          controller: VideoViewController.remote(
            rtcEngine: controller.service.engine,
            canvas: VideoCanvas(
              uid: host?.user?.id ?? 0,
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

      right = AnimatedSize(
        duration: const Duration(milliseconds: 150),
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
    } else {
      final host = controller.pkData!.lives.firstWhereOrNull(
          (e) => e.user!.id != controller.me.value.info.userID);

      left = AnimatedSize(
        duration: const Duration(milliseconds: 150),
        child: AgoraVideoView(
          controller: VideoViewController.remote(
            rtcEngine: controller.service.engine,
            canvas: VideoCanvas(
              uid: host?.user?.id ?? 0,
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

      right = AnimatedSize(
        duration: const Duration(milliseconds: 150),
        child: AgoraVideoView(
          key: UniqueKey(),
          controller: VideoViewController(
            rtcEngine: controller.service.engine,
            canvas: VideoCanvas(
              uid: controller.hostID,
              renderMode: RenderModeType.renderModeHidden,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 343.h,
      child: Row(
        children: [
          Expanded(flex: 1, child: left),
          Expanded(flex: 1, child: right),
        ],
      ),
    );
  }
}
