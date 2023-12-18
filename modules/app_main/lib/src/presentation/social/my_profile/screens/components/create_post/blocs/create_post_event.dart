import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';

abstract class CreatePostEvent {}

class CreatePostInitiated extends CreatePostEvent {}

class PostButtonTapped extends CreatePostEvent {
  final PostType postType;

  PostButtonTapped({required this.postType});
}

class SubjectTextFieldChanged extends CreatePostEvent {
  final String subject;
  SubjectTextFieldChanged(this.subject);
}

class ContentTextFieldChanged extends CreatePostEvent {
  final String content;
  ContentTextFieldChanged(this.content);
}

class FilesChanged extends CreatePostEvent {
  final List<File> files;
  FilesChanged(this.files);
}

class MediaTapped extends CreatePostEvent {
  final PostType postType;
  final User user;

  MediaTapped({
    required this.postType,
    required this.user,
  });
}

class RemoveMediaTapped extends CreatePostEvent {}

class ScopeTypeSelected extends CreatePostEvent {
  final ScopeType scopeType;
  ScopeTypeSelected(this.scopeType);
}
