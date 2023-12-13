import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class FollowingTabState extends CoreState with EquatableMixin {
  final bool hasLoadMore;
  final FollowingType followingType;
  final FollowingInfo? followingInfo;
  final int? userId;
  final String? query;

  FollowingTabState({
    this.followingInfo,
    this.hasLoadMore = true,
    this.followingType = FollowingType.followee,
    this.userId,
    this.query,
    super.status,
  });

  FollowingTabState copyWith({
    List<FollowingUser>? followingUsers,
    bool? hasLoadMore,
    FollowingInfo? followingInfo,
    FollowingType? followingType,
    int? userId,
    String? query,
  }) {
    return FollowingTabState(
      followingInfo: followingInfo ?? this.followingInfo,
      hasLoadMore: hasLoadMore ?? this.hasLoadMore,
      followingType: followingType ?? this.followingType,
      userId: userId ?? this.userId,
      query: query ?? this.query,
    );
  }

  bool isInitial() {
    return followingInfo == null;
  }

  bool isEmpty() {
    return (followingInfo?.info ?? []).isEmpty;
  }

  FollowingRelation get relationFriend {
    return const FollowingRelation(
      isFriend: true,
      isFollowee: true,
      isFollower: true,
      hasPendingApproval: false,
      isBlocked: false,
      isBlocking: false,
    );
  }

  FollowingRelation get relationFollower {
    return const FollowingRelation(
      isFriend: false,
      isFollowee: true,
      isFollower: false,
      hasPendingApproval: false,
      isBlocked: false,
      isBlocking: false,
    );
  }

  FollowingRelation get relationFollowee {
    return const FollowingRelation(
      isFriend: false,
      isFollowee: false,
      isFollower: true,
      hasPendingApproval: false,
      isBlocked: false,
      isBlocking: false,
    );
  }

  FollowingRelation get relationPendingApproval {
    return const FollowingRelation(
      isFriend: false,
      isFollowee: false,
      isFollower: false,
      hasPendingApproval: true,
      isBlocked: false,
      isBlocking: false,
    );
  }

  @override
  List<Object?> get props => [
        query,
        userId,
        followingInfo,
        followingType,
        hasLoadMore,
      ];
}
