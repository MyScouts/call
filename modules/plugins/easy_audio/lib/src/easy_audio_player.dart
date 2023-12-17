import 'package:easy_audio/src/entities/process_player.dart';
import 'package:flutter/material.dart';

import 'easy_audio_controller.dart';

const kSizeEasyAudioPlayer = 150.0;
typedef BuilderSlider = Widget Function(
    Duration? duration, Duration? posision, bool isLoadDone);

typedef BuilderController = Widget Function(
    String? duration, String? posision, bool isLoadDone);

typedef FormatTimeSlider = String Function(Duration duration);

class EasyAudioPlayer extends StatefulWidget {
  const EasyAudioPlayer({
    super.key,
    required this.controller,
    this.loading,
    this.buttonStop,
    this.formatTimeSlider,
    required this.builderSlider,
    this.builderController,
    this.height = kSizeEasyAudioPlayer,
    this.controlMainAxisAlignment = MainAxisAlignment.start,
  });

  final EasyAudioController controller;
  final BuilderSlider builderSlider;
  final BuilderController? builderController;
  final FormatTimeSlider? formatTimeSlider;
  final Widget? loading;
  final Widget? buttonStop;
  final double height;
  final MainAxisAlignment controlMainAxisAlignment;

  @override
  State<EasyAudioPlayer> createState() => _EasyAudioPlayerState();
}

class _EasyAudioPlayerState extends State<EasyAudioPlayer> {
  EasyAudioController get controller => widget.controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final isLoading = controller.isOpenPlayer &&
              controller.isPlaying == false &&
              controller.isLoading;

          return ValueListenableBuilder<ProcessPlayer>(
            valueListenable: controller.onProgress,
            builder: (_, data, __) {
              var duration = '00:00';
              var position = '00:00';

              if (!isLoading &&
                  data.duration != null &&
                  data.position != null) {
                duration = widget.formatTimeSlider != null
                    ? widget.formatTimeSlider!(data.duration!)
                    : data.duration.toString();
                position = widget.formatTimeSlider != null
                    ? widget.formatTimeSlider!(data.position!)
                    : data.position.toString();
              }

              return Column(
                mainAxisAlignment: widget.controlMainAxisAlignment,
                children: [
                  widget.builderSlider(
                    data.duration,
                    data.position,
                    !isLoading,
                  ),
                  if (widget.builderController != null)
                    widget.builderController!.call(
                      duration,
                      position,
                      !isLoading,
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(position),
                          const Spacer(),
                          Text(duration),
                        ],
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
