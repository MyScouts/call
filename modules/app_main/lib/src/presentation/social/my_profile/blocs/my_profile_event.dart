abstract class MyProfileEvent {}

class MyProfileInitiated extends MyProfileEvent {}

class MyProfileLoadMore extends MyProfileEvent {}

class MyProfileRefreshed extends MyProfileEvent {}

class Search extends MyProfileEvent {
  final String keyword;

  Search(this.keyword);
}

class ReactPostTapped extends MyProfileEvent {
  ReactPostTapped({required this.postId, required this.isHearted});
  final int postId;
  final bool isHearted;
}

class ReactLatestCommentTapped extends MyProfileEvent {
  ReactLatestCommentTapped({required this.commentId, required this.isHearted});
  final int commentId;
  final bool isHearted;
}

