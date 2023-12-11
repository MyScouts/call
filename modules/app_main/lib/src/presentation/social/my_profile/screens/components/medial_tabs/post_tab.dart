import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/common/subordinate_scroll.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_header_user_info.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_video_thumbnail_widget.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_comment_widget.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/profile_avatar.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../widgets/multiple_image.dart';

class PostTab extends StatefulWidget {
  const PostTab({
    required this.posts,
    required this.onLoadMore,
    required this.postType,
    required this.controller,
    this.newPost,
    this.mediaFiles,
    super.key,
  });
  final List<Post> posts;
  final Function onLoadMore;
  final Post? newPost;
  final List<MediaFile?>? mediaFiles;
  final PostType postType;
  final SubordinateScrollController controller;

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> with AutomaticKeepAliveClientMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    widget.controller.addListener(() {
      if (widget.controller.position.pixels >=
          widget.controller.position.maxScrollExtent) {
        widget.onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final paddingLineBottom = MediaQuery.viewPaddingOf(context).bottom;

    super.build(context);

    return CustomScrollView(
      shrinkWrap: true,
      key: widget.key,
      physics: const ClampingScrollPhysics(),
      controller: widget.controller,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: AppColors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.posts.isNotEmpty) const SizedBox(height: 16),
                if (widget.newPost != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: LinearProgressIndicator(
                          value: null,
                        ),
                      ),
                      IgnorePointer(
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.5),
                            BlendMode.hardLight,
                          ),
                          child: _buildPost(
                            widget.newPost!,
                            isNewPost: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (widget.posts.isNotEmpty)
                  ...widget.posts.map((post) => _buildPost(post)),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: widget.posts.isEmpty && widget.newPost == null
                ? Padding(
                    padding: EdgeInsets.only(bottom: paddingLineBottom),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        ImageWidget(
                          IconAppConstants.icDoubleImage,
                          width: 80,
                          height: 80,
                        ),
                        const Text(
                          'Chưa có bài viết nào',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey76,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()),
      ],
    );
  }

  Widget _buildPost(Post post, {bool isNewPost = false}) {
    bool hasMedia = post.getListMedia.isNotEmpty;
    if (isNewPost) {
      hasMedia = widget.mediaFiles != null && widget.mediaFiles!.isNotEmpty;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  context.startPostDetail(
                    post: post,
                    myProfileBloc: context.read<MyProfileBloc>(),
                  );
                },
                child: PostHeaderUserInfo(
                  user: post.user,
                  time: post.getTime,
                  isShowSetting: true,
                ),
              ),
              if (hasMedia) const SizedBox(height: 12),
              if (hasMedia)
                SizedBox(
                  height: 172.h,
                  child: _buildShowMedia(
                    isNewPost: isNewPost,
                    postType: widget.postType,
                    post: post,
                  ),
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
                trimMode: TrimModeRM.LINE,
                trimLines: 3,
                expandedText: '',
                collapsedText: '...Xem thêm',
                seeMore: true,
                dataStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                colorHighlightDetectedText: AppColors.blue34,
              ),
              const SizedBox(height: 12),
              ReactWidget(
                key: UniqueKey(),
                post: post,
                isNewPost: isNewPost,
                myProfileBloc: context.read<MyProfileBloc>(),
              ),
              _buildLatestComment(post.latestComment),
            ],
          ),
        ),
        const SizedBox(height: 28),
        const Divider(),
        const SizedBox(height: 28),
      ],
    );
  }

  Widget _buildLatestComment(Comment? latestComment) {
    if (latestComment == null) return const SizedBox.shrink();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ProfileAvatar(
                avatarUrl: latestComment.user.getUserAvatar,
                size: 42,
                isPDone: latestComment.user.getIsPDone,
                fontSize: 12,
                profileTypePadding: 2,
                avatarPadding: 3,
                backgroundColor: AppColors.blueEdit,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    latestComment.user.getdisplayName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black10,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  if (latestComment.user.getIsPDone)
                                    ImageWidget(
                                      IconAppConstants.icShopVdone,
                                      width: 24,
                                      height: 24,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildPostTime(latestComment.getTime),
                    ],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    latestComment.user.getPDoneId,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey77,
                    ),
                  ),
                  Text(
                    latestComment.getContent,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      ReactCommentWidget(
                        commentId: latestComment.id!,
                        latestCommentTotalReaction:
                            latestComment.getTotalReaction,
                        isHearted: latestComment.getIsHearted,
                      ),
                      const SizedBox(width: 14),
                      ImageWidget(
                        IconAppConstants.icComment,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 5),
                      const Text('Phản hồi',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildShowMedia({
    required bool isNewPost,
    required PostType postType,
    required Post post,
  }) {
    final medias = post.getListMedia;
    if (isNewPost) {
      switch (postType) {
        case PostType.text:
          return CommonMultiImageView.multiFile(
            listFile: widget.mediaFiles!.map((media) {
              if (media != null) return media.path;
              return '';
            }).toList(),
            width: double.infinity,
            radius: 12,
          );
        case PostType.video:
          return SizedBox(
            width: double.infinity,
            child: CommonVideoPlayer(
              videoType: VideoType.file,
              source: widget.mediaFiles!.first!.path,
            ),
          );
        default:
          break;
      }
    } else {
      switch (postType) {
        case PostType.text:
          return CommonMultiImageView.multiNetwork(
            listNetwork: medias.map((media) => media.link ?? '').toList(),
            width: double.infinity,
            radius: 12,
            onTapImage1: () {
              context.startPostDetail(
                post: post,
                imageScrollType: ImageScrollType.image1,
                myProfileBloc: context.read<MyProfileBloc>(),
              );
            },
            onTapImage2: () {
              context.startPostDetail(
                post: post,
                imageScrollType: ImageScrollType.image2,
                myProfileBloc: context.read<MyProfileBloc>(),
              );
            },
            onTapImage3: () {
              context.startPostDetail(
                post: post,
                imageScrollType: ImageScrollType.image3,
                myProfileBloc: context.read<MyProfileBloc>(),
              );
            },
          );
        case PostType.video:
          return PostVideoThumbnailWidget(
            onTap: () {
              context.startPostPreview(
                post: post,
                myProfileBloc: context.read<MyProfileBloc>(),
                currentMediaIndex: -1,
                onChange: (_) => {},
              );
            },
            child: CommonVideoPlayer(
              videoType: VideoType.network,
              source: medias.first.link!,
              isShowOnlyPlayIcon: true,
            ),
          );

        default:
          break;
      }
    }

    return const SizedBox.shrink();
  }

  Widget _buildPostTime(String time) {
    return Text(
      time,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grey77,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
