import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/common/subordinate_scroll.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_comment_widget.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/profile_avatar.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                ...widget.posts.map((post) => _buildPost(post)),
              ],
            ),
          ),
        )
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: ProfileAvatar(
                      avatarUrl: post.user.getUserAvatar,
                      size: 42,
                      isPDone: post.user.getIsPDone,
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
                        _buildInfoDetail(post),
                        const SizedBox(height: 2),
                        _buildPostTime(post.getTime),
                      ],
                    ),
                  ),
                ],
              ),
              if (hasMedia) const SizedBox(height: 12),
              if (hasMedia)
                SizedBox(
                  height: 172,
                  child: _buildShowMedia(
                    isNewPost: isNewPost,
                    postType: widget.postType,
                    medias: post.getListMedia,
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
              ReadMoreHashtag(
                data: post.getContent,
                trimMode: TrimModeRM.LINE,
                trimLines: 3,
                expandedText: '',
                collapsedText: '...Xem thêm',
                dataStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                colorHighlightDetectedText: AppColors.blue34,
              ),
              const SizedBox(height: 12),
              ReactWidget(post: post, isNewPost: isNewPost),
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
    required List<Media> medias,
  }) {
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
            listNetwork:
                medias.map((media) => media.link ?? '').toList(),
            width: double.infinity,
            radius: 12,
          );
        case PostType.video:
          return SizedBox(
            width: double.infinity,
            child: CommonVideoPlayer(
              videoType: VideoType.network,
              source: medias.first.link!,
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

  Widget _buildInfoDetail(Post post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              post.user.getdisplayName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black10,
              ),
            ),
            if (post.user.getIsPDone) const SizedBox(width: 4),
            if (post.user.getIsPDone)
              ImageWidget(
                IconAppConstants.icShopVdone,
                width: 24,
                height: 24,
              ),
            const SizedBox(width: 8),
            Text(
              post.user.getPDoneId,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey77,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => print('setting'),
          child: const Icon(
            Icons.more_vert,
            size: 24,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
