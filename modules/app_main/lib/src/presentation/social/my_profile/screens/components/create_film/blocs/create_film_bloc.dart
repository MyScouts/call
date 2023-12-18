import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'create_film_event.dart';
import 'create_film_state.dart';

@injectable
class CreateFilmBloc extends CoreBloc<CreateFilmEvent, CreateFilmState> {
  CreateFilmBloc() : super(CreateFilmState()) {
    on<CreateFilmInitiated>(onCreateFilmInitiated);
    on<ContentTextFieldChanged>(
      onContentTextFieldChanged,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 150))
          .switchMap(mapper),
    );
    on<ShareButtonTapped>(onShareButtonTapped);
    on<ScopeTypeSelected>(onScopeTypeSelected);
  }

  void onCreateFilmInitiated(
      CreateFilmInitiated event, Emitter<CreateFilmState> emit) async {
    emit(state.copyWith(
      userInfo: event.user,
      mediaFile: event.mediaFile,
      postType: event.postType,
    ));
  }

  void onShareButtonTapped(
      ShareButtonTapped event, Emitter<CreateFilmState> emit) async {
    final createFilmPayload = CreatePostPayload(
      scopeType: state.typeScopeSelected,
      subject: '',
      content: state.content,
      postType: state.postType!,
      mediaFiles: [state.mediaFile],
    );

    AppCoordinator.rootNavigator.currentContext?.pop(data: createFilmPayload);
  }

  void onContentTextFieldChanged(
      ContentTextFieldChanged event, Emitter<CreateFilmState> emit) async {
    emit(state.copyWith(
      content: event.content,
    ));
  }


  void onScopeTypeSelected(
      ScopeTypeSelected event, Emitter<CreateFilmState> emit) async {
    emit(state.copyWith(typeScopeSelected: event.scopeType));
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
