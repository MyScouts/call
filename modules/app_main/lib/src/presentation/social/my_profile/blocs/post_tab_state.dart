import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class PostTabState extends CoreState with EquatableMixin {
  final User? userInfo;
  final List<Post>? posts;
  final Post? newPost;
  final bool hasLoadMore;
  final GetUserFollowDetailResponse? userFollowDetail;
  final List<MediaFile?>? postMediaFiles;
  final PostType currentPostType;

  PostTabState({
    this.userInfo,
    this.posts,
    this.hasLoadMore = true,
    this.newPost,
    this.userFollowDetail,
    this.postMediaFiles,
    this.currentPostType = PostType.text,
    super.status,
  });

  PostTabState copyWith({
    User? userInfo,
    List<Post>? posts,
    bool? hasLoadMore,
    Post? newPost,
    List<MediaFile?>? postMediaFiles,
    GetUserFollowDetailResponse? userFollowDetail,
    PostType? currentPostType,
  }) {
    return PostTabState(
      userInfo: userInfo ?? this.userInfo,
      posts: posts ?? this.posts,
      hasLoadMore: hasLoadMore ?? this.hasLoadMore,
      newPost: newPost,
      postMediaFiles: postMediaFiles,
      currentPostType: currentPostType ?? this.currentPostType,
      userFollowDetail: userFollowDetail ?? this.userFollowDetail,
    );
  }

  bool isInitial() {
    return posts == null;
  }

  bool isEmpty() {
    return ((posts ?? []).isEmpty) && newPost == null;
  }

  @override
  List<Object?> get props => [
        userFollowDetail,
        currentPostType,
        posts,
        hasLoadMore,
        newPost,
        postMediaFiles,
        userInfo,
      ];
}
