import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/data/repositories/media_picker.dart';
import 'package:app_main/src/domain/usecases/post_usecase.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_coordinator.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/generated/l10n.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallet/core/networking/exception/api_exception.dart';

import '../my_profile_constants.dart';
import 'film_tab_event.dart';
import 'film_tab_state.dart';

@injectable
class FilmTabBloc extends CoreBloc<FilmTabEvent, FilmTabState> {
  final PostUsecase _postUsecase;
  final MediaPicker _mediaPicker;

  FilmTabBloc(
    this._postUsecase,
    this._mediaPicker,
  ) : super(FilmTabState()) {
    on<FilmTabInitiated>(onFilmTabInitiated);
    on<FilmTabLoadMore>(onFilmTabLoadmore);
    on<FilmTabRefreshed>(onFilmTabRefreshed);
    on<CreateFilmButtonTapped>(onCreateFilmButtonTapped);
    on<CreateNewFilm>(onCreateNewFilm);
  }

  int _page = 1;
  int _totalNewFilm = 0;

  final RefreshController _controller = RefreshController();
  RefreshController get controller => _controller;

  late StreamController<int> switchTabController = StreamController.broadcast();

  void onFilmTabInitiated(
      FilmTabInitiated event, Emitter<FilmTabState> emit) async {
    _page = 1;

    emit(state.copyWith(
      hasLoadMore: true,
      userInfo: event.userInfo,
      currentPostType: event.postType,
    ));

    await getFilms(event.postType, emit);
  }

  FutureOr<void> getFilms(PostType postType, Emitter<FilmTabState> emit) async {
    final films = await _postUsecase.getPostsByType(
      id: state.userInfo!.id!,
      page: _page,
      type: postType.name,
      isGetComment: false,
      pageSize: MyProfileConstant.filmPageSize,
    );

    emit(state.copyWith(films: films));
  }

  void onFilmTabLoadmore(_, Emitter<FilmTabState> emit) async {
    if (state.hasLoadMore) {
      _page++;
      final films = await _postUsecase.getPostsByType(
        id: state.userInfo!.id!,
        page: _page,
        type: state.currentPostType.name,
        isGetComment: false,
        pageSize: MyProfileConstant.filmPageSize,
      );

      bool hasLoadMore = true;
      if (films.length < MyProfileConstant.filmPageSize) {
        hasLoadMore = false;
      }

      // remove posts when loadmore with new post
      if (films.length >= _totalNewFilm) {
        while (_totalNewFilm != 0) {
          films.removeAt(0);
          _totalNewFilm--;
        }
      }

      emit(state.copyWith(
        films: [...state.films!, ...films],
        hasLoadMore: hasLoadMore,
      ));
    }
    _controller.loadComplete();
  }

  Future<void> onCreateFilmButtonTapped(
      CreateFilmButtonTapped event, Emitter<FilmTabState> emit) async {
    final mediaFile = await _mediaPicker.pickVideoFromGallery();

    if (mediaFile != null) {
      final output = MyProfileConstant.checkInput(
        isPDone: state.userInfo.getIsPDone,
        mediaFiles: [mediaFile],
        postType: state.currentPostType,
      );
      if (output.canPost) {
        final data =
            await AppCoordinator.rootNavigator.currentContext?.startCreateFilm(
          postType: PostType.film,
          user: state.userInfo!,
          mediaFile: mediaFile,
        );
        if (data != null) {
          final film = data as CreatePostPayload;
          add(CreateNewFilm(createFilmPayload: film));
        }
      } else {
        AppCoordinator.rootNavigator.currentContext
            ?.showToastText(output.errorMessage);
      }
    }
  }

  Future<void> onCreateNewFilm(
      CreateNewFilm event, Emitter<FilmTabState> emit) async {
    var newFilm = Post(
      content: event.createFilmPayload.content,
      user: state.userInfo,
    );

    emit(state.copyWith(
      newFilm: newFilm,
      newMediaFiles: event.createFilmPayload.mediaFiles,
    ));

    try {
      newFilm = await _postUsecase.createPost(event.createFilmPayload);
      newFilm = newFilm.copyWith(user: state.userInfo);
      _totalNewFilm++;
      emit(state.copyWith(
        newFilm: null,
        films: [newFilm, ...state.films!],
        newMediaFiles: [],
      ));
    } on ApiException catch (e) {
      AppCoordinator.rootNavigator.currentContext?.showToastMessage(
        e.message,
        ToastMessageType.error,
      );
      emit(state.copyWith(
        newFilm: null,
        newMediaFiles: [],
      ));
    } on DioException catch (_) {
      AppCoordinator.rootNavigator.currentContext?.showToastMessage(
        S.current.messages_server_internal_error.capitalize(),
        ToastMessageType.error,
      );
      emit(state.copyWith(
        newFilm: null,
        newMediaFiles: [],
      ));
    } catch (e) {
      AppCoordinator.rootNavigator.currentContext?.showToastMessage(
        S.current.messages_server_internal_error.capitalize(),
        ToastMessageType.error,
      );
      emit(state.copyWith(
        newFilm: null,
        newMediaFiles: [],
      ));
    }
  }

  void onFilmTabRefreshed(_, Emitter<FilmTabState> emit) async {
    _page = 1;
    _totalNewFilm = 0;

    emit(state.copyWith(
      hasLoadMore: true,
    ));

    await getFilms(state.currentPostType, emit);
  }
}
