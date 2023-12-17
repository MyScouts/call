import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/social/react_payload.dart';
import 'package:app_main/src/domain/usecases/comment_usecase.dart';
import 'package:app_main/src/domain/usecases/post_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/generated/l10n.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

import '../my_profile_constants.dart';
import 'post_tab_event.dart';
import 'post_tab_state.dart';

@injectable
class PostTabBloc extends CoreBloc<PostTabEvent, PostTabState> {
  final UserUsecase _userUsecase;
  final PostUsecase _postUsecase;
  final CommentUsecase _commentUsecase;
  final UserUsecase _userRepository;

  PostTabBloc(
    this._userUsecase,
    this._postUsecase,
    this._commentUsecase,
    this._userRepository,
  ) : super(PostTabState()) {
    on<PostTabInitiated>(onPostTabInitiated);
    on<PostTabLoadMore>(onPostTabLoadmore);
    on<PostTabRefreshed>(onPostTabRefreshed);
    on<ReactPostTapped>(
      onReactPostTapped,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 150))
          .switchMap(mapper),
    );
    on<ReactLatestCommentTapped>(
      onReactLatestCommentTapped,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 150))
          .switchMap(mapper),
    );
    on<CreateNewPost>(onCreateNewPost);

    // on<Search>(
    //   onSearch,
    //   transformer: (event, mapper) => event
    //       .debounceTime(const Duration(milliseconds: 150))
    //       .switchMap(mapper),
    // );
  }

  int _page = 1;
  int _totalNewPost = 0;

  final RefreshController _controller = RefreshController();
  RefreshController get controller => _controller;

  late StreamController<bool> isScrolledController =
      StreamController.broadcast();
  late StreamController<int> switchTabController = StreamController.broadcast();

  void onPostTabInitiated(
      PostTabInitiated event, Emitter<PostTabState> emit) async {
    _page = 1;

    emit(state.copyWith(
      hasLoadMore: true,
      currentPostType: event.postType,
    ));

    await getProfile(emit);
    await getPosts(event.postType, emit);

    // if(event.createPostPayload != null){
    //   add(CreateNewPost(createPostPayload: event.createPostPayload!));
    // }
  }

  FutureOr<void> getProfile(Emitter<PostTabState> emit) async {
    final userInfo = await _userUsecase.getProfile();
    emit(state.copyWith(
      userInfo: userInfo,
    ));
    if (userInfo != null) {
      final userFollowDetail =
          await _userRepository.getFollowUser(userInfo.id!);
      emit(state.copyWith(
        userInfo: userInfo,
        userFollowDetail: userFollowDetail,
      ));
    }
  }

  FutureOr<void> getPosts(PostType postType, Emitter<PostTabState> emit) async {
    final posts = await _postUsecase.getPostsByType(
      id: state.userInfo!.id!,
      page: _page,
      type: postType.name,
    );

    emit(state.copyWith(posts: posts));
  }

  void onPostTabLoadmore(_, Emitter<PostTabState> emit) async {
    if (state.hasLoadMore) {
      _page++;
      final posts = await _postUsecase.getPostsByType(
        id: state.userInfo!.id!,
        page: _page,
        type: state.currentPostType.name,
      );

      bool hasLoadMore = true;
      if (posts.length < MyProfileConstant.textPostPageSize) {
        hasLoadMore = false;
      }

      // remove posts when loadmore with new post
      if (posts.length >= _totalNewPost) {
        while (_totalNewPost != 0) {
          posts.removeAt(0);
          _totalNewPost--;
        }
      }

      emit(state.copyWith(
        posts: [...state.posts!, ...posts],
        hasLoadMore: hasLoadMore,
      ));
    }
    _controller.loadComplete();
  }

  void onReactPostTapped(
      ReactPostTapped event, Emitter<PostTabState> emit) async {
    final currentPosts = state.posts!;
    List<Post> newPosts = _getNewReactPost(currentPosts, event);
    emit(state.copyWith(posts: newPosts));

    await _postUsecase.react(
      postId: event.newPost.id!,
      reactPayload: ReactPayload(
          isHearted: event.newPost.getIsHearted, type: ReactType.heart.getName),
    );
  }

  List<Post> _getNewReactPost(List<Post> posts, ReactPostTapped event) {
    final index = posts.indexWhere((element) => element.id == event.newPost.id);

    var newPosts = List.of(posts);
    newPosts.removeAt(index);
    newPosts.insert(index, event.newPost);

    return newPosts;
  }

  Future<void> onCreateNewPost(
      CreateNewPost event, Emitter<PostTabState> emit) async {
    var newPost = Post(
      subject: event.createPostPayload.subject,
      content: event.createPostPayload.content,
      user: state.userInfo,
    );

    emit(state.copyWith(
      newPost: newPost,
      postMediaFiles: event.createPostPayload.mediaFiles,
    ));

    try {
      newPost = await _postUsecase.createPost(event.createPostPayload);
      newPost = newPost.copyWith(user: state.userInfo);
      _totalNewPost++;
    } catch (e) {
      AppCoordinator.rootNavigator.currentContext?.showToastMessage(
        S.current.messages_server_internal_error.capitalize(),
        ToastMessageType.error,
      );
    } finally {
      emit(state.copyWith(
        newPost: null,
        posts: [newPost, ...state.posts!],
        postMediaFiles: [],
      ));
    }
  }

  void onReactLatestCommentTapped(
      ReactLatestCommentTapped event, Emitter<PostTabState> emit) async {
    await _commentUsecase.react(
      commentId: event.commentId,
      reactPayload: ReactPayload(
          isHearted: event.isHearted, type: ReactType.heart.getName),
    );
  }

  void onPostTabRefreshed(_, Emitter<PostTabState> emit) async {
    _page = 1;
    _totalNewPost = 0;

    emit(state.copyWith(
      hasLoadMore: true,
    ));

    await getProfile(emit);

    await getPosts(state.currentPostType, emit);
  }
}
