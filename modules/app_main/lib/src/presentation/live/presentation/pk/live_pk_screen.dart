import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/empty_stack_box.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_bottom_action.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_channel_header.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/pk_timer_builder.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/live_message_input.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/flex_diamond_builder.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_diamond_process.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_lose_builder.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_user_gift_line.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_win_lose_builder.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';

import '../channel/widget/sent_gift_page.dart';

class LivePkScreen extends StatelessWidget {
  const LivePkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SafeArea(
                child: LiveChannelHeader(),
              ),
              const SizedBox(height: 16),
              const _LivePKRtc(),
              Obx(() {
                if (controller.pkStep.value == PkStep.pending) {
                  return const EmptyStackBox();
                }

                if (controller.pkStep.value == PkStep.starting) {
                  return const EmptyStackBox();
                }

                return const PkDiamondProcess();
              }),
              Obx(() {
                if (controller.pkStep.value == PkStep.pending) {
                  return const EmptyStackBox();
                }

                if (controller.pkStep.value == PkStep.starting) {
                  return const EmptyStackBox();
                }

                return const PkUserGiftLine();
              }),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: LiveBottomAction(),
        ),
        IgnorePointer(
          ignoring: true,
          child: SentGiftPage(
            provider: controller.floatingGiftsProvider,
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
          if (controller.pkStep.value != PkStep.end) {
            return const EmptyStackBox();
          }

          return const _PkEndGameBuilder();
        }),
      ],
    );
  }
}

class _PkEndGameBuilder extends StatelessWidget {
  const _PkEndGameBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Align(
      alignment: Alignment.center,
      child: PkWinLoseBuilder(
        key: Key('${controller.info.id}'),
        liveID: controller.info.id,
        builder: (status) {
          return PkEndGameItem(
            url: controller.host?.info.avatar ?? '',
            status: status,
          );
        },
      ),
    );
  }
}

class _LivePKRtc extends StatelessWidget {
  const _LivePKRtc({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return SizedBox(
      height: 343.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FlexDiamondBuilder(builder: (l, r) {
            return Row(
              children: [
                Expanded(
                  flex: l,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const _RtcOtherLive(),
                      Obx(() {
                        if (controller.pkStep.value != PkStep.end) {
                          return const EmptyStackBox();
                        }

                        return PkWinLoseBuilder(
                          key: Key('${controller.liveOtherID}'),
                          liveID: controller.liveOtherID,
                          builder: (status) {
                            if (status == PkGameStatus.draw) {
                              return const EmptyStackBox();
                            }

                            if (status == PkGameStatus.win) {
                              return Align(
                                alignment: Alignment.bottomLeft,
                                child: SizedBox.square(
                                  dimension: 61,
                                  child: Assets.icons_lives_win_small.image(),
                                ),
                              );
                            }

                            return Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox.square(
                                dimension: 61,
                                child: Assets.icons_lives_lose_small.image(),
                              ),
                            );
                          },
                        );
                      })
                    ],
                  ),
                ),
                Expanded(
                  flex: r,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const _RtcLive(),
                      Obx(() {
                        if (controller.pkStep.value != PkStep.end) {
                          return const EmptyStackBox();
                        }

                        return PkWinLoseBuilder(
                          key: Key('${controller.info.id}'),
                          liveID: controller.info.id,
                          builder: (status) {
                            if (status == PkGameStatus.draw) {
                              return const EmptyStackBox();
                            }

                            if (status == PkGameStatus.win) {
                              return Align(
                                alignment: Alignment.bottomRight,
                                child: SizedBox.square(
                                  dimension: 61,
                                  child: Assets.icons_lives_win_small.image(),
                                ),
                              );
                            }

                            return Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox.square(
                                dimension: 61,
                                child: Assets.icons_lives_lose_small.image(),
                              ),
                            );
                          },
                        );
                      })
                    ],
                  ),
                ),
              ],
            );
          }),
          Obx(() {
            if (controller.pkStep.value != PkStep.pending) {
              return const EmptyStackBox();
            }

            if (!controller.me.value.isOwner) {
              return const EmptyStackBox();
            }

            return Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: controller.showConfigPk,
                behavior: HitTestBehavior.opaque,
                child: ImageWidget(
                  Assets.icons_lives_start_pk.path,
                  fit: BoxFit.contain,
                  borderRadius: 52,
                  height: 52,
                  width: 52,
                ),
              ),
            );
          }),
          Obx(() {
            if (controller.pkStep.value != PkStep.starting) {
              return const EmptyStackBox();
            }
            return Align(
              alignment: Alignment.center,
              child: _StartPk(onEnd: controller.readyPk),
            );
          }),
          Obx(() {
            if (controller.pkStep.value != PkStep.started &&
                controller.pkStep.value != PkStep.end) {
              return const EmptyStackBox();
            }

            if (controller.currentGameRound == null) {
              return const EmptyStackBox();
            }

            return Align(
              alignment: Alignment.bottomCenter,
              child: PkTimerBuilder(
                endTime: controller.currentGameRound!.endAt,
                builder: (d, end) {
                  if (end) {}

                  final time = '${pkPad(d.inMinutes % 60)}:'
                      '${pkPad(d.inSeconds % 60)}';

                  return Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(36, 36, 36, 0.88),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox.square(
                          dimension: 17,
                          child: Assets.icons_lives_pk_2.image(),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _RtcOtherLive extends StatelessWidget {
  const _RtcOtherLive({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: controller.service.engine,
        canvas: VideoCanvas(
          uid: controller.hostOtherID,
          renderMode: RenderModeType.renderModeHidden,
          mirrorMode: VideoMirrorModeType.videoMirrorModeEnabled,
          sourceType: VideoSourceType.videoSourceCamera,
        ),
        connection: RtcConnection(
          channelId: controller.agora?.channel,
        ),
      ),
    );
  }
}

class _RtcLive extends StatelessWidget {
  const _RtcLive({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

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
    );
  }
}

String pkPad(int n) => n.toString().padLeft(2, '0');

class _StartPk extends StatefulWidget {
  const _StartPk({super.key, required this.onEnd});

  final VoidCallback onEnd;

  @override
  State<_StartPk> createState() => _StartPkState();
}

class _StartPkState extends State<_StartPk> {
  Timer? _timer;

  int end = 3;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => start());
  }

  void start() {
    if (_timer != null) _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (end <= 0) {
        _timer?.cancel();
        widget.onEnd();
        return;
      }
      if (mounted) {
        setState(() {
          end -= 1;
        });
      }
    });
  }

  @override
  void dispose() {
    if (_timer != null) _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'DK sẽ bắt đầu trong',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          end.toString(),
          style: const TextStyle(
            fontSize: 64,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
