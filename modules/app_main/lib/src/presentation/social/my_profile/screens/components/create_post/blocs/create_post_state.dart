import 'package:app_main/src/data/models/payloads/social/new_post_payload.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class CreatePostState extends CoreState with EquatableMixin {
  final bool isShowPostButton;
  final String subject;
  final List<MediaFile?> files;
  final String content;
  final NewPostPayload? newPostPayload;
  final ScopeType typeScopeSelected;

  CreatePostState({
    this.isShowPostButton = false,
    this.subject = '',
    this.content = '',
    this.files = const [],
    this.newPostPayload,
    this.typeScopeSelected = ScopeType.public,
  });

  CreatePostState copyWith({
    bool? isShowPostButton,
    String? content,
    String? subject,
    List<MediaFile?>? files,
    NewPostPayload? newPostPayload,
    ScopeType? typeScopeSelected,
  }) {
    return CreatePostState(
      isShowPostButton: isShowPostButton ?? this.isShowPostButton,
      subject: subject ?? this.subject,
      content: content ?? this.content,
      files: files ?? this.files,
      newPostPayload: newPostPayload ?? this.newPostPayload,
      typeScopeSelected: typeScopeSelected ?? this.typeScopeSelected,
    );
  }

  @override
  List<Object?> get props => [
        typeScopeSelected,
        newPostPayload,
        isShowPostButton,
        subject,
        content,
        files
      ];
}
