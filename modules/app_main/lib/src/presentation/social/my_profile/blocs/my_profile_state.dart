import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class MyProfileState extends CoreState with EquatableMixin {
  final User? userInfo;
  //text post
  final List<Post> textPosts;
  final Post? newTextPost;
  final bool hasTextPostLoadMore;
  final List<MediaFile?>? textPostMediaFiles;
  //video post

  final List<Post> videoPosts;
  final Post? newVideoPost;
  final bool hasVideoPostLoadMore;
  final List<MediaFile?>? videoPostMediaFiles;

  final PostType currentPostType;

  MyProfileState({
    this.userInfo,
    this.textPosts = const [],
    this.hasTextPostLoadMore = true,
    this.newTextPost,
    this.textPostMediaFiles = const [],
    this.videoPosts = const [],
    this.hasVideoPostLoadMore = true,
    this.newVideoPost,
    this.videoPostMediaFiles = const [],
    this.currentPostType = PostType.text,
    super.status,
  });

  MyProfileState copyWith({
    User? userInfo,
    StateStatus? status,
    List<Post>? textPosts,
    bool? isSearching,
    bool? hasTextPostLoadMore,
    Post? newTextPost,
    List<MediaFile?>? textPostMediaFiles,
    List<Post>? videoPosts,
    bool? hasVideoPostLoadMore,
    Post? newVideoPost,
    List<MediaFile?>? videoPostMediaFiles,
    PostType? currentPostType,
  }) {
    return MyProfileState(
      userInfo: userInfo ?? this.userInfo,
      status: status ?? this.status,
      textPosts: textPosts ?? this.textPosts,
      hasTextPostLoadMore: hasTextPostLoadMore ?? this.hasTextPostLoadMore,
      newTextPost: newTextPost,
      textPostMediaFiles: textPostMediaFiles,
      videoPosts: videoPosts ?? this.videoPosts,
      hasVideoPostLoadMore: hasVideoPostLoadMore ?? this.hasVideoPostLoadMore,
      newVideoPost: newVideoPost,
      videoPostMediaFiles: videoPostMediaFiles,
      currentPostType: currentPostType ?? this.currentPostType,
    );
  }

  @override
  List<Object?> get props => [
        currentPostType,
        videoPosts,
        hasVideoPostLoadMore,
        newVideoPost,
        videoPostMediaFiles,
        textPostMediaFiles,
        newTextPost,
        userInfo,
        textPosts,
        hasTextPostLoadMore
      ];
}
