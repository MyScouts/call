import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/live/presentation/create/state/live_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class LiveCreateScreen extends StatefulWidget {
  const LiveCreateScreen({super.key});

  @override
  State<LiveCreateScreen> createState() => _LiveCreateScreenState();
}

class _LiveCreateScreenState extends State<LiveCreateScreen> {
  late final LiveCreateController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller =
        context.findAncestorWidgetOfExactType<LiveDataProvider>()!.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.state.value == LiveCreateState.loading) {
          return const Center(
            child: PlatformLoadingIndicator(size: 30),
          );
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            AgoraVideoView(
              controller: VideoViewController(
                rtcEngine: controller.service.engine,
                canvas: const VideoCanvas(
                  uid: 0,
                  renderMode: RenderModeType.renderModeHidden,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaY: 5,
                          sigmaX: 5,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tiêu đề phát trực tiếp',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        height: 1.2,
                                      ),
                                    ),
                                    _LiveType(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _LiveType extends StatelessWidget {
  const _LiveType({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        border: Border.all(color: const Color(0xff8C8C8C)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(4.5),
        child: Row(
          children: [
            Icon(Icons.ac_unit, color: Colors.white, size: 20),
            SizedBox(width: 4.5),
            Text(
              'Bạn bè',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff8C8C8C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
