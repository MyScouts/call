import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';

class CreatePostPayload {
  final PostType postType;
  final String subject;
  final String content;
  final ScopeType scopeType;
  final List<MediaFile?>? mediaFiles;

  CreatePostPayload({
    required this.postType,
    required this.subject,
    required this.content,
    required this.scopeType,
    this.mediaFiles,
  });
}
