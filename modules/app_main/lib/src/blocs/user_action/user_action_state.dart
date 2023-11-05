part of 'user_action_cubit.dart';

@immutable
sealed class UserActionState {}

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
