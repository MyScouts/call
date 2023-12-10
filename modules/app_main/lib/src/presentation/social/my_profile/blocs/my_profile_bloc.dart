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
  final UserUsecase _userRepository;

  MyProfileBloc(
    this._userUsecase,
    this._postUsecase,
    this._commentUsecase,
    this._userRepository,
  ) : super(MyProfileState()) {
    on<MyProfileInitiated>(onMyProfileInitiated);
    on<MyProfileLoadMore>(onMyProfileLoadmore);
    on<MyProfileRefreshed>(onMyProfileRefreshed);
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
    on<IndividualSwitchTab>(onIndividualSwitchTab);

    // on<Search>(
    //   onSearch,
    //   transformer: (event, mapper) => event
    //       .debounceTime(const Duration(milliseconds: 150))
    //       .switchMap(mapper),
    // );
  }

  int _textPage = 1;
  int _videoPage = 1;

  late StreamController<bool> isScrolledController =
      StreamController.broadcast();
  late StreamController<int> switchTabController = StreamController.broadcast();

  void onMyProfileInitiated(_, Emitter<MyProfileState> emit) async {
    _textPage = 1;
    _videoPage = 1;

    emit(state.copyWith(
      hasVideoPostLoadMore: true,
      hasTextPostLoadMore: true,
    ));

    await getProfile(emit);
    await getPosts(state.currentPostType, emit);
  }

  FutureOr<void> getProfile(Emitter<MyProfileState> emit) async {
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

  FutureOr<void> getPosts(
      PostType postType, Emitter<MyProfileState> emit) async {
    final postsText = await _postUsecase.getPostsByType(
      id: state.userInfo!.id!,
      page: _textPage,
      type: postType.name,
    );

    switch (postType) {
      case PostType.text:
        emit(state.copyWith(
          textPosts: postsText,
        ));
      case PostType.video:
        emit(state.copyWith(
          videoPosts: postsText,
        ));
      default:
        return;
    }
  }

  void onMyProfileLoadmore(_, Emitter<MyProfileState> emit) async {
    int _page = 0;
    if (state.currentPostType.isText) {
      _page = ++_textPage;
    }
    if (state.currentPostType.isVideo) {
      _page = ++_videoPage;
    }

    final posts = await _postUsecase.getPostsByType(
      id: state.userInfo!.id!,
      page: _page,
      type: state.currentPostType.name,
    );

    switch (state.currentPostType) {
      case PostType.text:
        bool hasLoadMore = true;
        if (posts.length < MyProfileConstant.textPostPageSize) {
          hasLoadMore = false;
        }
        emit(state.copyWith(
          textPosts: [...state.textPosts, ...posts],
          hasTextPostLoadMore: hasLoadMore,
        ));
      case PostType.video:
        bool hasLoadMore = true;
        if (posts.length < MyProfileConstant.textPostPageSize) {
          hasLoadMore = false;
        }
        emit(state.copyWith(
          videoPosts: [...state.videoPosts, ...posts],
          hasTextPostLoadMore: hasLoadMore,
        ));
      default:
        return;
    }
  }

  void onReactPostTapped(
      ReactPostTapped event, Emitter<MyProfileState> emit) async {
    if (state.currentPostType.isText) {
      final posts = state.textPosts;
      List<Post> newPosts = _getNewReactPost(posts, event);
      emit(state.copyWith(textPosts: newPosts));
    }

    if (state.currentPostType.isVideo) {
      final posts = state.videoPosts;
      List<Post> newPosts = _getNewReactPost(posts, event);
      emit(state.copyWith(videoPosts: newPosts));
    }

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
      CreateNewPost event, Emitter<MyProfileState> emit) async {
    var newPost = Post(
      subject: event.createPostPayload.subject,
      content: event.createPostPayload.content,
      user: state.userInfo,
    );

    switch (state.currentPostType) {
      case PostType.text:
        emit(state.copyWith(
          newTextPost: newPost,
          textPostMediaFiles: event.createPostPayload.mediaFiles,
        ));

        newPost = await _postUsecase.createPost(event.createPostPayload);
        newPost = newPost.copyWith(user: state.userInfo);

        emit(state.copyWith(
          newTextPost: null,
          textPosts: [newPost, ...state.textPosts],
          textPostMediaFiles: [],
        ));
      case PostType.video:
        emit(state.copyWith(
          newVideoPost: newPost,
          videoPostMediaFiles: event.createPostPayload.mediaFiles,
        ));

        newPost = await _postUsecase.createPost(event.createPostPayload);
        newPost = newPost.copyWith(user: state.userInfo);

        emit(state.copyWith(
          newVideoPost: null,
          videoPosts: [newPost, ...state.videoPosts],
          videoPostMediaFiles: [],
        ));
      default:
        break;
    }
  }

  Future<void> onIndividualSwitchTab(
      IndividualSwitchTab event, Emitter<MyProfileState> emit) async {
    PostType postType = PostType.getTypeByIndex(event.index);

    emit(state.copyWith(currentPostType: postType));

    switch (postType) {
      case PostType.video:
        if (state.videoPosts.isEmpty) {
          await getPosts(postType, emit);
        }

      default:
        break;
    }
  }

  void onReactLatestCommentTapped(
      ReactLatestCommentTapped event, Emitter<MyProfileState> emit) async {
    await _commentUsecase.react(
      commentId: event.commentId,
      reactPayload: ReactPayload(
          isHearted: event.isHearted, type: ReactType.heart.getName),
    );
  }

  void onMyProfileRefreshed(_, Emitter<MyProfileState> emit) async {
    _textPage = 1;
    _videoPage = 1;

    emit(state.copyWith(
      hasVideoPostLoadMore: true,
      hasTextPostLoadMore: true,
    ));

    await getProfile(emit);

    await getPosts(state.currentPostType, emit);
  }
}
