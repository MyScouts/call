import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';

abstract class PostTabEvent {}

class PostTabInitiated extends PostTabEvent {
  PostTabInitiated({
    required this.postType,
    required this.userInfo,
  });
  final PostType postType;
  final User userInfo;
}

class PostTabLoadMore extends PostTabEvent {}

class PostTabRefreshed extends PostTabEvent {}

class PostTabSearch extends PostTabEvent {
  final String query;

  PostTabSearch(this.query);
}

class ReactPostTapped extends PostTabEvent {
  ReactPostTapped({required this.newPost});
  final Post newPost;
}

class ReactLatestCommentTapped extends PostTabEvent {
  ReactLatestCommentTapped({required this.commentId, required this.isHearted});
  final int commentId;
  final bool isHearted;
}

class CreateNewPost extends PostTabEvent {
  CreateNewPost({required this.createPostPayload});
  final CreatePostPayload createPostPayload;
}
