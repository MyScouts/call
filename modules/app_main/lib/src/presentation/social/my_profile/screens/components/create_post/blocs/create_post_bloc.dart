import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/data/repositories/media_picker.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:injectable/injectable.dart';

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
    on<SubjectTextFieldChanged>(onSubjectTextFieldChanged);
    on<ContentTextFieldChanged>(onContentTextFieldChanged);
    on<FilesChanged>(onFilesChanged);
    on<MediaTapped>(onMediaTapped);
    on<RemoveMediaTapped>(onRemoveMediaTapped);
    on<ScopeTypeSelected>(onScopeTypeSelected);

    add(CreatePostInitiated());
  }

  void onCreatePostInitiated(_, Emitter<CreatePostState> emit) async {}

  void onPostButtonTapped(
      PostButtonTapped event, Emitter<CreatePostState> emit) async {}

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
    if (event.postType.isText) {
      final mediaFiles = await _mediaPicker.pickImagesFromGallery();
      if (mediaFiles == null || mediaFiles.isEmpty) return;
      emit(state.copyWith(
        files: mediaFiles,
      ));

      return;
    }

    if (event.postType.isVideo) {
      final mediaFile = await _mediaPicker.pickVideoFromGallery();
      if (mediaFile == null) return;

      emit(state.copyWith(
        files: [mediaFile],
      ));

      return;
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
