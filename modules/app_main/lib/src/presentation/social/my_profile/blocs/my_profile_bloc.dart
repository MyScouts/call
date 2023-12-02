import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:app_main/src/domain/usecases/comment_usecase.dart';
import 'package:app_main/src/domain/usecases/post_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../my_profile_constants.dart';
import 'my_profile_event.dart';
import 'my_profile_state.dart';

@injectable
class MyProfileBloc extends CoreBloc<MyProfileEvent, MyProfileState> {
  final UserUsecase _userUsecase;
  final PostUsecase _postUsecase;
  final CommentUsecase _commentUsecase;

  MyProfileBloc(
    this._userUsecase,
    this._postUsecase,
    this._commentUsecase,
  ) : super(MyProfileState()) {
    on<MyProfileInitiated>(onMyProfileInitiated);
    on<MyProfileLoadMore>(onMyProfileLoadmore);
    on<MyProfileRefreshed>(onMyProfileInitiated);
    on<ReactPostTapped>(
      onReactPostTapped,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 300))
          .switchMap(mapper),
    );
     on<ReactLatestCommentTapped>(
      onReactLatestCommentTapped,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 300))
          .switchMap(mapper),
    );

    // on<Search>(
    //   onSearch,
    //   transformer: (event, mapper) => event
    //       .debounceTime(const Duration(milliseconds: 150))
    //       .switchMap(mapper),
    // );
    add(MyProfileInitiated());
  }

  int _page = 1;

  void onMyProfileInitiated(_, Emitter<MyProfileState> emit) async {
    _page = 1;
    emit(state.copyWith(
      hasLoadMore: true,
      comments: [],
    ));

    await getProfile(emit);
    await getPosts(emit);
  }

  FutureOr<void> getProfile(Emitter<MyProfileState> emit) async {
    final userInfo = await _userUsecase.getProfile();
    emit(state.copyWith(
      userInfo: userInfo,
    ));
  }

  FutureOr<void> getPosts(Emitter<MyProfileState> emit) async {
    final postsText = await _postUsecase.getPostsByType(
      id: state.userInfo!.id!,
      page: _page,
      type: PostType.text.name,
    );

    emit(state.copyWith(
      posts: postsText,
    ));
  }

  void onMyProfileLoadmore(_, Emitter<MyProfileState> emit) async {
    _page++;
    final postsText = await _postUsecase.getPostsByType(
      id: state.userInfo!.id!,
      page: _page,
      type: PostType.text.name,
    );
    bool hasLoadMore = true;
    if (postsText.length < MyProfileConstant.textPostPageSize) {
      hasLoadMore = false;
    }
    emit(state.copyWith(
      posts: [...state.posts, ...postsText],
      hasLoadMore: hasLoadMore,
    ));
  }

  void onReactPostTapped(
      ReactPostTapped event, Emitter<MyProfileState> emit) async {
    await _postUsecase.react(
      postId: event.postId,
      reactPayload: ReactPayload(isHearted: event.isHearted, type: 'HEART'),
    );

    // List<Post> newPosts = [];
    // for (final post in state.posts) {
    //   if (post.id == event.postId) {
    //     final newPost = post.copyWith(
    //       isHearted: event.isHearted,
    //       totalReaction: event.isHearted
    //           ? post.getTotalReaction + 1
    //           : post.getTotalReaction - 1,
    //     );
    //     newPosts.add(newPost);
    //   } else {
    //     newPosts.add(post);
    //   }
    // }
    // emit(state.copyWith(
    //   posts: newPosts,
    // ));
  }

  void onReactLatestCommentTapped(
      ReactLatestCommentTapped event, Emitter<MyProfileState> emit) async {
    await _commentUsecase.react(
      commentId: event.commentId,
      reactPayload: ReactPayload(isHearted: event.isHearted, type: 'HEART'),
    );

  }
}
