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
    List<MediaFile?>? mediaFiles = [];
    if (event.postType.isText) {
      mediaFiles = await _mediaPicker.pickImagesFromGallery();
    }

    if (event.postType.isVideo) {
      final mediaFile = await _mediaPicker.pickVideoFromGallery();
      mediaFiles!.add(mediaFile);
    }

    if (mediaFiles == null || mediaFiles.isEmpty) return;

    final output = MyProfileConstant.checkInput(
      isPDone: event.user.getIsPDone,
      mediaFiles: mediaFiles,
      postType: event.postType,
    );

    if (output.canPost) {
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
      AppCoordinator.rootNavigator.currentContext
          ?.showToastText(output.errorMessage);
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
}
