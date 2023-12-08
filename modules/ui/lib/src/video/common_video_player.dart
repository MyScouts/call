import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

enum VideoType { network, file }

class CommonVideoPlayer extends StatefulWidget {
  const CommonVideoPlayer({
    required this.videoType,
    required this.source,
    this.autoPlay = false,
    this.isShowOnlyPlayIcon = false,
    super.key,
  });
  final VideoType videoType;
  final String source;
  final bool autoPlay;
  final bool isShowOnlyPlayIcon;

  @override
  CommonVideoPlayerState createState() => CommonVideoPlayerState();
}

class CommonVideoPlayerState extends State<CommonVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    initialController();
  }

  Future<void> initialController() async {
    switch (widget.videoType) {
      case VideoType.network:
        videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(widget.source));
        break;
      case VideoType.file:
        videoPlayerController = VideoPlayerController.file(File(widget.source));
        break;
    }

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: widget.autoPlay,
      looping: false,
      hideControlsTimer: Duration.zero,
      customControls: widget.isShowOnlyPlayIcon ? _buildPlayIcon() : null,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    setState(() {});

     chewieController!.addListener(() {
      if (chewieController!.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  Widget _buildPlayIcon() {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: videoPlayerController.value.aspectRatio,
      child: chewieController == null
          ? const SizedBox.shrink()
          : Chewie(
              controller: chewieController!,
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController?.dispose();
  }
}
