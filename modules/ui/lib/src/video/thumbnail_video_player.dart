import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'custom_video_player.dart';

class ThumbnailVideoPlayer extends StatefulWidget {
  const ThumbnailVideoPlayer({
    required this.videoType,
    required this.source,
    this.isShowPlay = true,
    this.width,
    this.height,
    super.key,
  });
  final CustomVideoType videoType;
  final String source;
  final bool isShowPlay;
  final double? width;
  final double? height;

  @override
  State<ThumbnailVideoPlayer> createState() => _ThumbnailVideoPlayerState();
}

class _ThumbnailVideoPlayerState extends State<ThumbnailVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  Future<void> _initController() async {
    switch (widget.videoType) {
      case CustomVideoType.network:
        videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(widget.source));
        break;
      case CustomVideoType.file:
        videoPlayerController = VideoPlayerController.file(File(widget.source));
        break;
    }

    await videoPlayerController.initialize();
    setState(() {});
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
    return videoPlayerController.value.isInitialized
        ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              if (widget.width == null && widget.height == null)
                AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController),
                )
              else
                SizedBox(
                  width: widget.width,
                  height: widget.height,
                  child: VideoPlayer(videoPlayerController),
                ),
              if (widget.isShowPlay) _buildPlayIcon(),
            ],
          )
        : const SizedBox.shrink();
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
}
