import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

enum CustomVideoType { network, file }

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    required this.videoType,
    required this.source,
    this.headerChild,
    this.bottomChild,
    this.fullscreenBuilder,
    this.nextTimeBuilder,
    this.backTimeBuilder,
    this.volumeBuilder,
    this.playBuilder,
    this.isSliderAtEndOfVideo = false,
    this.videoPlayerController,
    this.isShowInfo = true,
    this.isPlaying = true,
    this.isFullscreen = false,
    this.isShowBottomChild = true,
    this.isMute = false,
    super.key,
  });
  final CustomVideoType videoType;
  final String source;
  final Widget? headerChild;
  final Widget? bottomChild;
  final Widget Function(bool)? playBuilder;
  final Widget Function(bool)? fullscreenBuilder;
  final Widget Function()? nextTimeBuilder;
  final Widget Function()? backTimeBuilder;
  final Widget Function(bool)? volumeBuilder;
  final bool isSliderAtEndOfVideo;
  final VideoPlayerController? videoPlayerController;
  final bool isShowInfo;
  final bool isPlaying;
  final bool isFullscreen;
  final bool isShowBottomChild;
  final bool isMute;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  bool isShowInfo = true;
  bool isPlaying = true;
  bool isFullscreen = false;
  bool isShowBottomChild = true;
  bool isMute = false;
  final seekTime = const Duration(seconds: 15);

  @override
  void initState() {
    super.initState();
    _initController();
    _initDefaultValue();
  }

  void _initDefaultValue(){
    isShowInfo = widget.isShowInfo;
    isPlaying = widget.isPlaying;
    isFullscreen = widget.isFullscreen;
    isShowBottomChild = widget.isShowBottomChild;
    isMute = widget.isMute;
  }

  Future<void> _initController() async {
    if (widget.videoPlayerController != null) {
      videoPlayerController = widget.videoPlayerController!;
    } else {
      switch (widget.videoType) {
        case CustomVideoType.network:
          videoPlayerController =
              VideoPlayerController.networkUrl(Uri.parse(widget.source));
          break;
        case CustomVideoType.file:
          videoPlayerController =
              VideoPlayerController.file(File(widget.source));
          break;
      }

      await videoPlayerController.initialize();
      await videoPlayerController.play();
      setState(() {});
    }

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildVideo();
  }

  Widget _buildVideo() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isShowInfo = !isShowInfo;
            });
          },
          child: Container(
            color: Colors.black,
            child: (videoPlayerController.value.isInitialized)
                ? Center(
                    child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          VideoPlayer(videoPlayerController),
                          Visibility(
                            visible: isShowInfo,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildBackTime(),
                                const SizedBox(width: 10),
                                _buildPlay(),
                                const SizedBox(width: 10),
                                _buildNextTime(),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: isShowInfo,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _buildVolume(),
                                    const SizedBox(width: 5),
                                    _buildFullscreen(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (widget.isSliderAtEndOfVideo)
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: _buildSlider(),
                            ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        if (widget.headerChild != null && !isFullscreen)
          Visibility(
            visible: isShowInfo,
            child: widget.headerChild!,
          ),
        if (!widget.isSliderAtEndOfVideo) _buildSlider(),
      ],
    );
  }

  Visibility _buildSlider() {
    return Visibility(
      visible: isShowInfo,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: VideoSlider(videoPlayerController),
            ),
            if (widget.bottomChild != null && isShowBottomChild)
              widget.bottomChild!,
            SizedBox(height: MediaQuery.viewPaddingOf(context).bottom),
          ],
        ),
      ),
    );
  }

  Widget _buildNextTime() {
    return GestureDetector(
      onTap: () {
        setState(() {
          final position = videoPlayerController.value.position;
          final duration = videoPlayerController.value.duration;

          if (position != duration) {
            videoPlayerController.seekTo(position + seekTime);
          }
        });
      },
      child: widget.nextTimeBuilder == null
          ? _buildIconOutlined(
              isActived: true,
              iconSource: Icons.fast_forward,
              activedIconSource: Icons.fast_forward,
              circlePadding: 8,
              iconSize: 26,
            )
          : widget.nextTimeBuilder!(),
    );
  }

  Widget _buildBackTime() {
    return GestureDetector(
      onTap: () {
        setState(() {
          final position = videoPlayerController.value.position;
          if (position.inSeconds != 0) {
            videoPlayerController.seekTo(position - seekTime);
          }
        });
      },
      child: widget.backTimeBuilder == null
          ? _buildIconOutlined(
              isActived: true,
              iconSource: Icons.fast_rewind,
              activedIconSource: Icons.fast_rewind,
              circlePadding: 8,
              iconSize: 26,
            )
          : widget.backTimeBuilder!(),
    );
  }

  Widget _buildVolume() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMute = !isMute;
          if (isMute) {
            videoPlayerController.setVolume(0);
          } else {
            videoPlayerController.setVolume(1);
          }
        });
      },
      child: widget.volumeBuilder == null
          ? _buildIconOutlined(
              isActived: isMute,
              iconSource: Icons.volume_up_outlined,
              activedIconSource: Icons.volume_off_outlined,
            )
          : widget.volumeBuilder!(isMute),
    );
  }

  Widget _buildFullscreen() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFullscreen = !isFullscreen;
          isShowInfo = false;
          isShowBottomChild = false;

          if (isFullscreen) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
          } else {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
            isShowBottomChild = true;
            isShowInfo = true;
          }
        });
      },
      child: widget.fullscreenBuilder == null
          ? _buildIconOutlined(
              isActived: isFullscreen,
              activedIconSource: Icons.fullscreen_exit,
              iconSource: Icons.fullscreen,
            )
          : widget.fullscreenBuilder!(isFullscreen),
    );
  }

  Widget _buildPlay() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
          isPlaying
              ? videoPlayerController.play()
              : videoPlayerController.pause();
        });
      },
      child: widget.playBuilder == null
          ? _buildIconOutlined(
              isActived: isPlaying,
              activedIconSource: Icons.pause,
              iconSource: Icons.play_arrow,
              iconSize: 36,
              circlePadding: 10,
            )
          : widget.playBuilder!(isPlaying),
    );
  }

  Widget _buildIconOutlined({
    required IconData activedIconSource,
    required IconData iconSource,
    required bool isActived,
    double circlePadding = 8,
    double iconSize = 28,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(circlePadding),
        child: Icon(
          isActived ? activedIconSource : iconSource,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}

class VideoSlider extends StatefulWidget {
  const VideoSlider(
    this.controller, {
    super.key,
  });

  final VideoPlayerController controller;

  @override
  State<VideoSlider> createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
  _VideoSliderState() {
    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };
  }

  late VoidCallback listener;

  VideoPlayerController get controller => widget.controller;
  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void deactivate() {
    controller.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      final int duration = controller.value.duration.inSeconds;
      final int position = controller.value.position.inSeconds;
      final double sliderValue = position / duration;

      return Column(
        children: [
          Row(
            children: [
              TimeDisplayWidget(seconds: position, isShowSlash: true),
              TimeDisplayWidget(seconds: duration),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              value: sliderValue,
              onChanged: (value) {
                controller.seekTo(Duration(
                  seconds: (value * duration).toInt(),
                ));
              },
              activeColor: Colors.blue,
              thumbColor: Colors.white,
              inactiveColor: Colors.white.withOpacity(0.3),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

class TimeDisplayWidget extends StatelessWidget {
  final int seconds;
  final bool isShowSlash;

  const TimeDisplayWidget(
      {super.key, required this.seconds, this.isShowSlash = false});

  @override
  Widget build(BuildContext context) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int remainingSeconds = seconds % 60;

    final String formattedTime = hours > 0
        ? '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}'
        : '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

    return Text(
      '$formattedTime${isShowSlash ? ' / ' : ''}',
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}
