import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_comment_widget.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/profile_avatar.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../widgets/multiple_image.dart';

class PostTab extends StatefulWidget {
  const PostTab({required this.posts, required this.onLoadMore, super.key});
  final List<Post> posts;
  final Function onLoadMore;

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> with AutomaticKeepAliveClientMixin {
  final myProfileBloc = getIt<MyProfileBloc>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var controller = PrimaryScrollController.of(context);
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent) {
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
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    widget.posts.map((post) => _buildPost(post)).toList()),
          ),
        )
      ],
    );
  }

  Widget _buildPost(Post post) {
    final hasMedia = post.getListMedia.isNotEmpty;

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
                  child: CommonMultiImageView.multiAsset(
                    listAssetPath: post.getListMedia
                        .map((media) => media.link ?? '')
                        .toList(),
                    width: double.infinity,
                    radius: 12,
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
              ReactWidget(post: post),
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
