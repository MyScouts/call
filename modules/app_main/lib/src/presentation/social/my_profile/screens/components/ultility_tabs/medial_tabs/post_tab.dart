import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/post_tab_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/post_tab_event.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/post_tab_state.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/common/subordinate_scroll.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/empty_post.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_header_user_info.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_video_thumbnail_widget.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_comment_widget.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/profile_avatar.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_widget.dart';
import 'package:app_main/src/presentation/social/widgets/social_refresher.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../../../widgets/multiple_image.dart';

class PostTab extends StatefulWidget {
  const PostTab({
    required this.postType,
    required this.refresh,
    required this.createPostPayload,
    super.key,
  });
  final PostType postType;
  final ValueNotifier<bool> refresh;
  final ValueNotifier<CreatePostPayload?> createPostPayload;

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> with AutomaticKeepAliveClientMixin {
  SubordinateScrollController? scrollController;
  final bloc = getIt<PostTabBloc>();

  @override
  void initState() {
    super.initState();

    _initController();
    bloc.add(PostTabInitiated(postType: widget.postType));
    _onListener();
  }

  void _onListener() {
    widget.refresh.addListener(() {
      bloc.add(PostTabRefreshed());
    });

    widget.createPostPayload.addListener(() {
      if (widget.createPostPayload.value != null) {
        bloc.add(
            CreateNewPost(createPostPayload: widget.createPostPayload.value!));
      }
    });
  }

  void _initController() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final parentController = PrimaryScrollController.of(context);
      if (scrollController?.parent != parentController) {
        scrollController?.dispose();
        scrollController = SubordinateScrollController(parentController);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<PostTabBloc, PostTabState>(
          buildWhen: (previous, current) =>
              previous.posts != current.posts ||
              previous.hasLoadMore != current.hasLoadMore ||
              previous.newPost != current.newPost ||
              previous.postMediaFiles != current.postMediaFiles,
          builder: (context, state) {
            final posts = state.posts;
            final newPost = state.newPost;

            if (state.isInitial()) {
              return const LoadingWidget();
            }

            if (state.isEmpty()) {
              return EmptyPost(postType: widget.postType);
            }

            return scrollController == null
                ? const SizedBox.shrink()
                : SocialRefresher(
                    controller: bloc.controller,
                    scrollController: scrollController,
                    onLoading: () {
                      bloc.add(PostTabLoadMore());
                    },
                    isRefreshing: false,
                    child: CustomScrollView(
                      shrinkWrap: true,
                      key: widget.key,
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            color: AppColors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (posts!.isNotEmpty)
                                  const SizedBox(height: 16),
                                if (newPost != null)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16, bottom: 16),
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
                                            newPost,
                                            isNewPost: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if (posts.isNotEmpty)
                                  ...posts.map((post) => _buildPost(post)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }

  Widget _buildPost(Post post, {bool isNewPost = false}) {
    bool hasMedia = post.getListMedia.isNotEmpty;
    if (isNewPost) {
      hasMedia = bloc.state.postMediaFiles != null &&
          bloc.state.postMediaFiles!.isNotEmpty;
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
                    postTabBloc: bloc,
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
                postTabBloc: bloc,
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
      final mediaFiles = bloc.state.postMediaFiles!;
      switch (postType) {
        case PostType.text:
          return CommonMultiImageView.multiFile(
            listFile: mediaFiles.map((media) {
              if (media != null) return media.path;
              return '';
            }).toList(),
            width: double.infinity,
            radius: 12,
          );
        case PostType.video:
          return IgnorePointer(
            child: PostVideoThumbnailWidget(
              key: UniqueKey(),
              child: ThumbnailVideoPlayer(
                videoType: CustomVideoType.file,
                source: mediaFiles.first!.path,
              ),
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
                postTabBloc: bloc,
              );
            },
            onTapImage2: () {
              context.startPostDetail(
                post: post,
                imageScrollType: ImageScrollType.image2,
                postTabBloc: bloc,
              );
            },
            onTapImage3: () {
              context.startPostDetail(
                post: post,
                imageScrollType: ImageScrollType.image3,
                postTabBloc: bloc,
              );
            },
          );
        case PostType.video:
          return PostVideoThumbnailWidget(
            key: UniqueKey(),
            onTap: () {
              context.startPostPreview(
                post: post,
                postTabBloc: bloc,
                currentMediaIndex: -1,
                onChange: (_) => {},
              );
            },
            child: ThumbnailVideoPlayer(
              videoType: CustomVideoType.network,
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

  @override
  bool get wantKeepAlive => true;
}
