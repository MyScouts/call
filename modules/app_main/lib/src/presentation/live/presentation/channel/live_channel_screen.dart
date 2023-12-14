import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_size.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_pk_data.dart';
import 'package:app_main/src/presentation/live/domain/entities/user_diamond_for_pk.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_bottom_action.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_channel_header.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/live_end_screen.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/pip_video_render.dart';
import 'package:app_main/src/presentation/live/presentation/channel/widget/pk_timer_builder.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/live_message_input.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/live_opacity_builder.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
import 'package:app_main/src/presentation/live/presentation/pip/pip_view.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_diamond_process.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_lose_builder.dart';
import 'package:app_main/src/presentation/live/presentation/pk/widget/pk_user_gift_line.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
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
        value: controller.enablePk.value ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: controller.enablePk.value ? const Color(0xff032E49) : Colors.black.withOpacity(0.8),
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
                if (controller.enablePk.value) {
                  return const _LivePk();
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

class _LivePk extends StatelessWidget {
  const _LivePk({super.key});

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
                  return const Align(
                    alignment: Alignment.center,
                    child: SizedBox.shrink(),
                  );
                }

                if (controller.pkStep.value == PkStep.starting) {
                  return const Align(
                    alignment: Alignment.center,
                    child: SizedBox.shrink(),
                  );
                }

                return const PkDiamondProcess();
              }),
              Obx(() {
                if (controller.pkStep.value == PkStep.pending) {
                  return const Align(
                    alignment: Alignment.center,
                    child: SizedBox.shrink(),
                  );
                }

                if (controller.pkStep.value == PkStep.starting) {
                  return const Align(
                    alignment: Alignment.center,
                    child: SizedBox.shrink(),
                  );
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
            return const Align(
              alignment: Alignment.center,
              child: SizedBox.shrink(),
            );
          }

          final liveID = controller.me.value.liveID;

          final diamonds = controller.diamondsPK.value;

          diamonds.sort((a, b) => a.diamondCount.compareTo(b.diamondCount));

          if (diamonds.isEmpty) {
            final host = controller.members.firstWhereOrNull((e) => e.info.userID == controller.hostID);
            return Align(
              alignment: Alignment.center,
              child: PkEndGameItem(
                isWin: true,
                url: host?.info.avatar ?? '',
                isDraw: true,
              ),
            );
          }

          final mD = controller.members.firstWhereOrNull((e) => e.info.userID == diamonds.last.userId);

          final mU = controller.members.firstWhereOrNull((e) => e.info.userID == diamonds.first.userId);

          final aU = mU?.info.avatar ?? '';

          final aD = mD?.info.avatar ?? '';

          if (mU?.liveID == liveID) {
            return Align(
              alignment: Alignment.center,
              child: PkEndGameItem(
                isWin: true,
                url: aU,
                isDraw: diamonds.first.diamondCount == diamonds.last.diamondCount,
              ),
            );
          }

          return Align(
            alignment: Alignment.center,
            child: PkEndGameItem(
              isWin: false,
              url: aD,
              isDraw: diamonds.first.diamondCount == diamonds.last.diamondCount,
            ),
          );
        }),
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
        Obx(() => controller.virtualInfo.value != null
            ? VideoApp(virtualInfo: controller.info.virtualInfo)
            : const _RtcRender()),
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

class _LivePKRtc extends StatelessWidget {
  const _LivePKRtc({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    return Obx(() {
      if (controller.info.pk == null) return const SizedBox.shrink();

      final meInLive =
          controller.pkData!.lives.firstWhereOrNull((e) => e.user!.id == controller.me.value.info.userID) != null;

      final diamondPk = controller.diamondsPK.value;

      Widget left;
      Widget right;
      UserDiamondForPK? diamondLeft;
      UserDiamondForPK? diamondRight;
      int leftID;
      int rightID;

      if (meInLive) {
        final host = controller.pkData!.lives.firstWhereOrNull((e) => e.user!.id != controller.me.value.info.userID);

        diamondLeft = diamondPk.firstWhereOrNull((e) => e.userId == host?.user?.id);

        diamondRight = diamondPk.firstWhereOrNull((e) => e.userId == controller.me.value.info.userID);

        leftID = host?.id ?? 0;
        rightID = controller.info.id;

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
        final host = controller.pkData!.lives.firstWhereOrNull((e) => e.user!.id != controller.hostID);

        diamondLeft = diamondPk.firstWhereOrNull((e) => e.userId == host?.user?.id);

        diamondRight = diamondPk.firstWhereOrNull((e) => e.userId == controller.hostID);

        leftID = host?.id ?? 0;
        rightID = controller.info.id;

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
            controller: VideoViewController.remote(
              rtcEngine: controller.service.engine,
              canvas: VideoCanvas(
                uid: controller.hostID,
                renderMode: RenderModeType.renderModeHidden,
              ),
              connection: RtcConnection(
                channelId: controller.agora?.channel,
              ),
            ),
          ),
        );
      }

      int flexLeft = 1;
      int flexRight = 1;

      if (diamondLeft != null && diamondRight != null) {
        if (diamondLeft.diamondCount < diamondRight.diamondCount) {
          flexLeft = 4;
          flexRight = 6;
        } else if (diamondLeft.diamondCount > diamondRight.diamondCount) {
          flexLeft = 6;
          flexRight = 4;
        }
      }

      return SizedBox(
        height: 343.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              children: [
                Expanded(
                  flex: flexLeft,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      left,
                      Obx(() {
                        if (controller.pkStep.value != PkStep.end) {
                          return const Align(
                            alignment: Alignment.center,
                            child: SizedBox.shrink(),
                          );
                        }

                        final diamonds = controller.diamondsPK.value;

                        if (diamonds.isEmpty) {
                          return const Align(
                            alignment: Alignment.center,
                            child: SizedBox.shrink(),
                          );
                        }

                        if (diamonds.first.diamondCount == diamonds.last.diamondCount) {
                          return const Align(
                            alignment: Alignment.center,
                            child: SizedBox.shrink(),
                          );
                        }

                        diamonds.sort((a, b) => a.diamondCount.compareTo(b.diamondCount));

                        final mU = controller.members.firstWhereOrNull((e) => e.info.userID == diamonds.first.userId);

                        if (mU?.liveID == leftID) {
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
                      })
                    ],
                  ),
                ),
                Expanded(
                  flex: flexRight,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      right,
                      Obx(() {
                        if (controller.pkStep.value != PkStep.end) {
                          return const Align(
                            alignment: Alignment.center,
                            child: SizedBox.shrink(),
                          );
                        }

                        final diamonds = controller.diamondsPK.value;

                        if (diamonds.isEmpty) {
                          return const Align(
                            alignment: Alignment.center,
                            child: SizedBox.shrink(),
                          );
                        }

                        if (diamonds.first.diamondCount == diamonds.last.diamondCount) {
                          return const Align(
                            alignment: Alignment.center,
                            child: SizedBox.shrink(),
                          );
                        }

                        diamonds.sort((a, b) => a.diamondCount.compareTo(b.diamondCount));

                        final mU = controller.members.firstWhereOrNull((e) => e.info.userID == diamonds.first.userId);

                        if (mU?.liveID == rightID) {
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
                      })
                    ],
                  ),
                ),
              ],
            ),
            Obx(() {

              if (controller.pkStep.value != PkStep.pending) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox.shrink(),
                );
              }

              if (controller.pkData!.pk.hostID != controller.me.value.info.userID) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox.shrink(),
                );
              }

              if (!meInLive) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox.shrink(),
                );
              }

              return Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
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
                ),
              );
            }),
            Obx(() {
              if (controller.pkStep.value != PkStep.starting) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox.shrink(),
                );
              }
              return Align(
                alignment: Alignment.center,
                child: _StartPk(
                  onEnd: controller.readyPk,
                ),
              );
            }),
            Obx(() {
              if (controller.pkStep.value != PkStep.started && controller.pkStep.value != PkStep.end) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox.shrink(),
                );
              }

              if (controller.currentGameRound == null) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox.shrink(),
                );
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
    });
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
