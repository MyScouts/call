import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/new_post_payload.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class CreateFilmState extends CoreState with EquatableMixin {
  final MediaFile? mediaFile;
  final String content;
  final NewPostPayload? newFilmPayload;
  final ScopeType typeScopeSelected;
  final User? userInfo;
  final PostType? postType;

  CreateFilmState({
    this.content = '',
    this.mediaFile,
    this.newFilmPayload,
    this.typeScopeSelected = ScopeType.public,
    this.userInfo,
    this.postType,
  });

  CreateFilmState copyWith({
    String? content,
    NewPostPayload? newFilmPayload,
    ScopeType? typeScopeSelected,
    User? userInfo,
    MediaFile? mediaFile,
    PostType? postType,
  }) {
    return CreateFilmState(
      content: content ?? this.content,
      mediaFile: mediaFile ?? this.mediaFile,
      newFilmPayload: newFilmPayload ?? this.newFilmPayload,
      typeScopeSelected: typeScopeSelected ?? this.typeScopeSelected,
      userInfo: userInfo ?? this.userInfo,
      postType: postType ?? this.postType,
    );
  }

  @override
  List<Object?> get props => [
        postType,
        userInfo,
        typeScopeSelected,
        newFilmPayload,
        content,
        mediaFile,
      ];
}
