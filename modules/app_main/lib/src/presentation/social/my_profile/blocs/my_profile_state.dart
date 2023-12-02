
import 'package:app_core/app_core.dart';
import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';


class MyProfileState extends CoreState with EquatableMixin {
  final List<Post> posts;
  final bool hasLoadMore;
  final User? userInfo;
  final List<Comment> comments;

  MyProfileState({
    this.userInfo,
    this.posts = const [],
    this.hasLoadMore = true,
    this.comments = const [],
    super.status,
  });

  MyProfileState copyWith({
    User? userInfo,
    StateStatus? status,
    List<Post>? posts,
    bool? isSearching,
    bool? hasLoadMore,
    List<Comment>? comments,
  }) {
    return MyProfileState(
      userInfo: userInfo ?? this.userInfo,
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasLoadMore: hasLoadMore ?? this.hasLoadMore,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [comments, userInfo, posts, hasLoadMore];
}
