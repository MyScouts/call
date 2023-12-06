import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum VideoType { network, file }

class CommonVideoPlayer extends StatefulWidget {
  const CommonVideoPlayer({
    required this.videoType,
    required this.source,
    super.key,
  });
  final VideoType videoType;
  final String source;

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
        videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.source));
        break;
      case VideoType.file:
        videoPlayerController = VideoPlayerController.file(File(widget.source));
        break;
    }

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
    );
    setState(() {});
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
