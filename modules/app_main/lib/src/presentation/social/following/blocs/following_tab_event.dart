import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';

abstract class FollowingTabEvent {}

class FollowingTabInitiated extends FollowingTabEvent {
  final FollowingType followingType;
  final int? userId;

  FollowingTabInitiated({required this.followingType, this.userId});
}

class FollowingTabLoadMore extends FollowingTabEvent {}

class FollowingTabRefreshed extends FollowingTabEvent {}

class FollowUserTapped extends FollowingTabEvent {
  final FollowingUser followingUser;

  FollowUserTapped({
    required this.followingUser,
  });
}

class UnfollowUserTapped extends FollowingTabEvent {
  final FollowingUser followingUser;

  UnfollowUserTapped({required this.followingUser});
}

class UnfriendUserTapped extends FollowingTabEvent {
  final FollowingUser followingUser;

  UnfriendUserTapped({required this.followingUser});
}

class FollowingUserSearch extends FollowingTabEvent {
  final String? query;

  FollowingUserSearch({this.query});
}

