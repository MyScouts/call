import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import 'video_appbar_widget.dart';

class PostVideoWidget extends StatelessWidget {
  const PostVideoWidget({
    required this.videoType,
    required this.source,
    this.headerChild,
    this.bottomChild,
    this.isSliderAtEndOfVideo = false,
    super.key,
  });
  final CustomVideoType videoType;
  final String source;
  final Widget? headerChild;
  final Widget? bottomChild;
  final bool isSliderAtEndOfVideo;

  @override
  Widget build(BuildContext context) {
    return CustomVideoPlayer(
      source: source,
      videoType: videoType,
      bottomChild: bottomChild,
      headerChild: headerChild ?? const VideoAppbarWidget(),
      nextTimeBuilder: () {
        return ImageWidget(
          IconAppConstants.icVideoNextTime,
          width: 36,
        );
      },
      backTimeBuilder: () {
        return ImageWidget(
          IconAppConstants.icVideoBackTime,
          width: 36,
        );
      },
      isSliderAtEndOfVideo: isSliderAtEndOfVideo,
    );
  }

  
}
