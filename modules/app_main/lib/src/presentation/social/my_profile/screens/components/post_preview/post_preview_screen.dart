import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_header_user_info.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../widgets/double_tappable_interactive_viewer.dart';
import '../../widgets/post_video_widget.dart';
import '../../widgets/video_appbar_widget.dart';

class PostPreviewScreen extends StatefulWidget {
  static const String routeName = "post_preview";

  const PostPreviewScreen({
    required this.post,
    required this.myProfileBloc,
    required this.currentMediaIndex,
    required this.onChange,
    super.key,
  });

  final Post post;
  final int currentMediaIndex;
  final MyProfileBloc myProfileBloc;
  final Function(Post) onChange;

  @override
  State<PostPreviewScreen> createState() => _PostPreviewScreenState();
}

class _PostPreviewScreenState extends State<PostPreviewScreen> {
  late PageController previewController;
  bool isShowInfo = true;
  late PostType postType;

  @override
  void initState() {
    super.initState();
    previewController = PageController(initialPage: widget.currentMediaIndex);
    postType = PostType.getTypeByText(widget.post.getType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    const paddingHorizontal = 16.0;
    final paddingLineBottom = MediaQuery.viewPaddingOf(context).bottom;

    if (postType.isText) {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      isShowInfo = !isShowInfo;
                    });
                  },
                  child: _buildPageViewMedia(),
                ),
              ),
            ],
          ),
          Visibility(
            visible: isShowInfo,
            child: const VideoAppbarWidget(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: isShowInfo,
              child: Padding(
                padding: EdgeInsets.only(bottom: paddingLineBottom),
                child: _buildBottomChild(paddingHorizontal),
              ),
            ),
          ),
        ],
      );
    }

    if (postType.isVideo) {
      return PostVideoWidget(
        source: widget.post.getListMedia.first.link!,
        videoType: CustomVideoType.network,
        bottomChild: widget.currentMediaIndex == -1
            ? const SizedBox.shrink()
            : _buildBottomChild(paddingHorizontal),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildBottomChild(double paddingHorizontal) {
    return Container(
      color: AppColors.black.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          PostHeaderUserInfo(
            user: widget.post.user,
            time: widget.post.getTime,
            isShowSetting: false,
            isDarkMode: true,
          ),
          const SizedBox(height: 12),
          ReactWidget(
            post: widget.post,
            isNewPost: false,
            myProfileBloc: widget.myProfileBloc,
            isDarkMode: true,
            onChange: (Post newPost) {
              widget.onChange(newPost);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPageViewMedia() {
    if (postType.isText) {
      return PageView(
        controller: previewController,
        children: widget.post.getListMedia
            .map((media) => DoubleTappableInteractiveViewer(
                  scaleDuration: const Duration(milliseconds: 600),
                  child: ImageWidget(
                    media.link!,
                    fit: BoxFit.contain,
                  ),
                ))
            .toList(),
      );
    }

    if (postType.isVideo) {
      return CommonVideoPlayer(
        videoType: VideoType.network,
        source: widget.post.getListMedia[widget.currentMediaIndex].link!,
        autoPlay: true,
      );
    }

    return const SizedBox.shrink();
  }
}
