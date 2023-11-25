part of 'user_action_cubit.dart';

@immutable
sealed class UserActionState {
  final String friendCount;
  final String followerCount;
  final String followeeCount;

  const UserActionState({
    this.followeeCount = "0",
    this.followerCount = "0",
    this.friendCount = "0",
  });
}

final class UserActionInitial extends UserActionState {}

final class OnReportUser extends UserActionState {}

final class ReportUserSuccess extends UserActionState {}

final class ReportUserFail extends UserActionState {
  final String message;
  ReportUserFail({required this.message});
}

final class OnFollowUser extends UserActionState {}

final class FollowUserSuccess extends UserActionState {
  final bool isFriend;
  final bool isFollowed;
  FollowUserSuccess({required this.isFollowed, required this.isFriend});
}

final class FollowUserFail extends UserActionState {
  final String message;
  FollowUserFail({required this.message});
}

// UnFollow
final class OnUnFollow extends UserActionState {}

final class UnFollowSuccess extends UserActionState {}

final class UnFollowFail extends UserActionState {
  final String message;
  UnFollowFail({required this.message});
}

// Block user
final class OnBlockUser extends UserActionState {}

final class BlockUserSuccess extends UserActionState {}

final class BlockUserFail extends UserActionState {
  final String message;
  BlockUserFail({required this.message});
}

// Block user
final class OnGetFollowUser extends UserActionState {}

final class GetFollowUserSuccess extends UserActionState {
  final GetUserFollowDetailResponse followDetail;
  GetFollowUserSuccess({required this.followDetail});
}

final class GetFollowUserFail extends UserActionState {
  final String message;
  GetFollowUserFail({required this.message});
}
