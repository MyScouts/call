import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/app_size.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_header_user_info.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class PostDetailScreen extends StatefulWidget {
  static const String routeName = "post_detail";

  const PostDetailScreen(
      {required this.post,
      required this.myProfileBloc,
      this.imageScrollType,
      super.key});

  final Post post;
  final ImageScrollType? imageScrollType;
  final MyProfileBloc myProfileBloc;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  ScrollController scrollController = ScrollController();
  late List<GlobalKey> imagesGlobalKey;
  late Post post;
  final imageHeight = 248.0;

  @override
  void initState() {
    super.initState();
    post = widget.post;
    _scrollToImage();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _scrollToImage() {
    if (post.getListMedia.isNotEmpty) {
      imagesGlobalKey =
          List.generate(post.getListMedia.length, (_) => GlobalKey());
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.imageScrollType != null) {
          final targetObject = imagesGlobalKey[widget.imageScrollType!.index]
              .currentContext
              ?.findRenderObject();
          if (targetObject != null) {
            final viewport = RenderAbstractViewport.of(targetObject);
            final targetOffset = viewport.getOffsetToReveal(targetObject, 0.0);
            final paddingLineBottom = MediaQuery.viewPaddingOf(context).bottom;

            final halfScreenHeight = (SizeConfig.screenHeight -
                    kToolbarHeight -
                    statusBarHeight -
                    paddingLineBottom) /
                2;
            final centerOffset =
                targetOffset.offset - halfScreenHeight + imageHeight / 2;
            if (centerOffset > 0) {
              scrollController.jumpTo(centerOffset);
            }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = 16.0;
    final paddingLineBottom = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostHeaderUserInfo(
                    time: post.getTime,
                    user: post.user,
                    isShowSetting: false,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    post.getSubject,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ReadMoreHashtag(
                    data: post.getContent,
                    expandedText: '',
                    collapsedText: '...Xem thêm',
                    trimLines: 100,
                    dataStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    colorHighlightDetectedText: AppColors.blue34,
                  ),
                  const SizedBox(height: 8),
                  ReactWidget(
                    key: UniqueKey(),
                    post: post,
                    isNewPost: false,
                    myProfileBloc: widget.myProfileBloc,
                    onChange: (Post newPost) {
                      post = newPost;
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            ...post.getListMedia
                .mapIndexed((index, e) => _buildMedia(index, e)),
            SizedBox(height: paddingLineBottom),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia(int index, Media media) {
    PostType postType = PostType.getTypeByText(post.getType);
    if (media.link == null) return const SizedBox.shrink();

    if (postType.isText) {
      return Column(
        children: [
          InkWell(
            onTap: () => _handleOnTapMedia(index),
            child: ImageWidget(
              media.link!,
              key: imagesGlobalKey[index],
              width: double.infinity,
              height: imageHeight,
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    if (postType.isVideo) {
      return SizedBox(
        width: double.infinity,
        child: CommonVideoPlayer(
          videoType: VideoType.network,
          source: media.link!,
          // isShowOnlyPlayIcon: true,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Future<void> _handleOnTapMedia(int index) async {
    await context.startPostPreview(
        post: post,
        myProfileBloc: widget.myProfileBloc,
        currentMediaIndex: index,
        onChange: (Post newPost) {
          post = newPost;
        });
    setState(() {});
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Bài viết',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    );
  }
}
