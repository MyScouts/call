import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/presentation/channel/live_channel_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:provider/provider.dart';

class PipVideoRender extends StatelessWidget {
  const PipVideoRender({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();
    final commentController = context.read<LiveMessageBloc>();
    return Material(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _RtcRender(),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  AppCoordinator.rootNavigator.currentContext!,
                  MaterialPageRoute(
                    builder: (_) => MultiProvider(
                      providers: [
                        Provider<LiveChannelController>.value(
                          value: controller,
                        ),
                        BlocProvider(
                          create: (_) => getIt<LiveMessageBloc>()
                            ..add(UpdateMessageHistory(
                              commentController.state.comments,
                            )),
                        ),
                      ],
                      child: LiveChannelScreen(
                        fromPip: true,
                        liveID: controller.info.id,
                      ),
                    ),
                  ),
                );
                PipHandler.removeOverlay();
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SizedBox.square(
                  dimension: 30,
                  child: Center(
                    child: ImageWidget(Assets.icons_lives_pip_up.path),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RtcRender extends StatelessWidget {
  const _RtcRender({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();
    return Obx(() {
      if (controller.state.value == LiveStreamState.watching) {
        if (controller.me.value.isOwner) {
          return Hero(
            tag: 'render owner',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: controller.service.engine,
                  canvas: const VideoCanvas(
                    uid: 0,
                    renderMode: RenderModeType.renderModeHidden,
                  ),
                ),
              ),
            ),
          );
        }

        if (controller.hostInLive) {
          return Hero(
            tag: controller.hostID,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
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
            ),
          );
        }
      }

      return Center(
        child: PlatformLoadingIndicator(
          color: Theme.of(context).primaryColor,
        ),
      );
    });
  }
}
