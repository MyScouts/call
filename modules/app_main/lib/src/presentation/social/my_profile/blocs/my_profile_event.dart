import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';

abstract class MyProfileEvent {}

class MyProfileInitiated extends MyProfileEvent {}

class MyProfileLoadMore extends MyProfileEvent {}

class MyProfileRefreshed extends MyProfileEvent {}

class Search extends MyProfileEvent {
  final String keyword;

  Search(this.keyword);
}

class ReactPostTapped extends MyProfileEvent {
  ReactPostTapped({
    required this.newPost
  });
  final Post newPost;
}

class ReactLatestCommentTapped extends MyProfileEvent {
  ReactLatestCommentTapped({required this.commentId, required this.isHearted});
  final int commentId;
  final bool isHearted;
}

class CreateNewPost extends MyProfileEvent {
  CreateNewPost({required this.createPostPayload});
  final CreatePostPayload createPostPayload;
}

class IndividualSwitchTab extends MyProfileEvent {
  final int index;

  IndividualSwitchTab({required this.index});
}
