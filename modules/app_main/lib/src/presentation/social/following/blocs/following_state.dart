import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class FollowingState extends CoreState with EquatableMixin {
  final int? friendCount;
  final int? followerCount;
  final int? followeeCount;

  FollowingState({
    this.friendCount,
    this.followerCount,
    this.followeeCount,
    super.status,
  });

  FollowingState copyWith({
    int? friendCount,
    int? followerCount,
    int? followeeCount,
  }) {
    return FollowingState(
      friendCount: friendCount ?? this.friendCount,
      followerCount: followerCount ?? this.followerCount,
      followeeCount: followeeCount ?? this.followeeCount,
    );
  }

  @override
  List<Object?> get props => [
        friendCount,
        followerCount,
        followeeCount,
      ];
}
