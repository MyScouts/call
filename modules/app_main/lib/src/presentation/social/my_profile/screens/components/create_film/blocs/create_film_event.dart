import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';

abstract class CreateFilmEvent {}

class CreateFilmInitiated extends CreateFilmEvent {
  final MediaFile mediaFile;
  final User user;
  final PostType postType;


  CreateFilmInitiated({
    required this.mediaFile,
    required this.user,
    required this.postType,
  });
}

class ContentTextFieldChanged extends CreateFilmEvent {
  final String content;
  ContentTextFieldChanged(this.content);
}

class ShareButtonTapped extends CreateFilmEvent {}

class ScopeTypeSelected extends CreateFilmEvent {
  final ScopeType scopeType;
  ScopeTypeSelected(this.scopeType);
}
