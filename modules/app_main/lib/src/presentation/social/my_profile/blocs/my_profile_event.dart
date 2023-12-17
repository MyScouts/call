import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';

abstract class MyProfileEvent {}

class MyProfileInitiated extends MyProfileEvent {}

class MyProfileRefreshed extends MyProfileEvent {}

class Search extends MyProfileEvent {
  final String keyword;

  Search(this.keyword);
}

class CreateNewPost extends MyProfileEvent {
  CreateNewPost({required this.createPostPayload});
  final CreatePostPayload createPostPayload;
}

class IndividualSwitchTab extends MyProfileEvent {
  final int index;

  IndividualSwitchTab({required this.index});
}
