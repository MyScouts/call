import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/data/repositories/media_picker.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'create_post_event.dart';
import 'create_post_state.dart';

@injectable
class CreatePostBloc extends CoreBloc<CreatePostEvent, CreatePostState> {
  final MediaPicker _mediaPicker;

  CreatePostBloc(
    this._mediaPicker,
  ) : super(CreatePostState()) {
    on<CreatePostInitiated>(onCreatePostInitiated);
    on<PostButtonTapped>(onPostButtonTapped);
    on<SubjectTextFieldChanged>(
      onSubjectTextFieldChanged,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 150))
          .switchMap(mapper),
    );
    on<ContentTextFieldChanged>(
      onContentTextFieldChanged,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 150))
          .switchMap(mapper),
    );
    on<FilesChanged>(onFilesChanged);
    on<MediaTapped>(onMediaTapped);
    on<RemoveMediaTapped>(onRemoveMediaTapped);
    on<ScopeTypeSelected>(onScopeTypeSelected);

    add(CreatePostInitiated());
  }

  void onCreatePostInitiated(_, Emitter<CreatePostState> emit) async {}

  void onPostButtonTapped(
      PostButtonTapped event, Emitter<CreatePostState> emit) async {
    if (state.isShowPostButton) {
      final createPostPayload = CreatePostPayload(
        scopeType: state.typeScopeSelected,
        subject: state.subject,
        content: state.content,
        postType: event.postType,
        mediaFiles: state.files,
      );

      AppCoordinator.rootNavigator.currentContext?.pop(data: createPostPayload);
    }
  }

  void onSubjectTextFieldChanged(
      SubjectTextFieldChanged event, Emitter<CreatePostState> emit) async {
    emit(state.copyWith(
      subject: event.subject,
      isShowPostButton: _isShowPostButton(
        subject: event.subject,
        content: state.content,
      ),
    ));
  }

  void onContentTextFieldChanged(
      ContentTextFieldChanged event, Emitter<CreatePostState> emit) async {
    emit(state.copyWith(
      content: event.content,
      isShowPostButton: _isShowPostButton(
        subject: state.subject,
        content: event.content,
      ),
    ));
  }

  void onFilesChanged(FilesChanged event, Emitter<CreatePostState> emit) async {
    // state.copyWith(
    //   files: event.files,
    // );
  }

  void onMediaTapped(MediaTapped event, Emitter<CreatePostState> emit) async {
    bool canPost = false;
    String errorMessage = '';

    List<MediaFile?>? mediaFiles;
    if (event.postType.isText) {
      mediaFiles = await _mediaPicker.pickImagesFromGallery();
    }

    if (event.postType.isVideo) {
      final mediaFile = await _mediaPicker.pickVideoFromGallery();
      mediaFiles?.add(mediaFile);
    }

    if (mediaFiles == null || mediaFiles.isEmpty) return;

    if (event.user.getIsPDone) {
      canPost = inputRequired(
        mediaFiles: mediaFiles,
        postType: event.postType,
        imagesLength: MyProfileConstant.pDoneImagesLength,
        videoSecondsDuration: MyProfileConstant.pDoneVideoSecondsDuration,
        filmSecondsDuration: MyProfileConstant.pDoneFilmSecondsDuration,
        onErrorImagesLength: () {
          errorMessage =
              'Tài khoản PDone chỉ được đăng tối đa ${MyProfileConstant.pDoneImagesLength} ảnh';
        },
        onErrorVideoSecondsDuration: () {
          errorMessage =
              'Tài khoản PDone chỉ được đăng video tối đa ${MyProfileConstant.pDoneVideoSecondsDuration} phút';
        },
        onErrorFilmSecondsDuration: () {
          errorMessage =
              'Tài khoản PDone chỉ được đăng thước phim tối đa ${MyProfileConstant.pDoneFilmSecondsDuration} phút';
        },
      );
    } else {
      canPost = inputRequired(
        mediaFiles: mediaFiles,
        postType: event.postType,
        imagesLength: MyProfileConstant.imagesLength,
        videoSecondsDuration: MyProfileConstant.videoSecondsDuration,
        filmSecondsDuration: MyProfileConstant.filmSecondsDuration,
        onErrorImagesLength: () {
          errorMessage =
              'Tài khoản thường chỉ được đăng tối đa ${MyProfileConstant.imagesLength} ảnh';
        },
        onErrorVideoSecondsDuration: () {
          errorMessage =
              'Tài khoản thường chỉ được đăng video tối đa ${MyProfileConstant.videoSecondsDuration} phút';
        },
        onErrorFilmSecondsDuration: () {
          errorMessage =
              'Tài khoản thường chỉ được đăng thước phim tối đa ${MyProfileConstant.filmSecondsDuration} phút';
        },
      );
    }

    if (canPost) {
      if (event.postType.isText) {
        emit(state.copyWith(
          files: [...state.files, ...mediaFiles],
        ));
      }

      if (event.postType.isVideo) {
        emit(state.copyWith(
          files: mediaFiles,
        ));
      }
    } else {
      AppCoordinator.rootNavigator.currentContext?.showToastText(errorMessage);
    }
  }

  void onRemoveMediaTapped(_, Emitter<CreatePostState> emit) async {
    emit(state.copyWith(
      files: [],
    ));
  }

  void onScopeTypeSelected(
      ScopeTypeSelected event, Emitter<CreatePostState> emit) async {
    emit(state.copyWith(typeScopeSelected: event.scopeType));
  }

  bool _isShowPostButton({
    required String subject,
    required String content,
  }) {
    return subject.isNotEmpty && content.isNotEmpty;
  }

  bool inputRequired({
    required List<MediaFile?>? mediaFiles,
    required int imagesLength,
    required int videoSecondsDuration,
    required int filmSecondsDuration,
    required PostType postType,
    required Function() onErrorImagesLength,
    required Function() onErrorVideoSecondsDuration,
    required Function() onErrorFilmSecondsDuration,
  }) {
    if (mediaFiles != null) {
      switch (postType) {
        case PostType.text:
          if (mediaFiles.length > imagesLength) {
            onErrorImagesLength();
            return false;
          }
        case PostType.video:
          for (final file in mediaFiles) {
            if (file!.videoDuration.inSeconds > videoSecondsDuration) {
              onErrorVideoSecondsDuration();
              return false;
            }
          }
        case PostType.film:
          for (final file in mediaFiles) {
            if (file!.videoDuration.inSeconds > filmSecondsDuration) {
              onErrorFilmSecondsDuration();
              return false;
            }
          }
      }

      return true;
    }

    return false;
  }
}
