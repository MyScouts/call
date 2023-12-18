import 'package:app_main/src/presentation/live/domain/entities/virtual_info.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final VirtualInfo? virtualInfo;

  const VideoApp({super.key, this.virtualInfo});

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.virtualInfo == null) {
      return;
    }
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.virtualInfo!.url!))
      ..initialize().then((_) {
        setState(() {
          _controller?.seekTo(Duration(seconds: widget.virtualInfo!.startFromSecond!.toInt()));
          _controller?.play();
          _controller?.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller?.value.isInitialized == true
        ? Center(
            child: AspectRatio(aspectRatio: _controller!.value.aspectRatio, child: VideoPlayer(_controller!)),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
