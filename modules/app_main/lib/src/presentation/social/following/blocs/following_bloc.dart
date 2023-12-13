import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:injectable/injectable.dart';

import 'following_event.dart';
import 'following_state.dart';

@injectable
class FollowingBloc extends CoreBloc<FollowingEvent, FollowingState> {
  final UserUsecase _userUsecase;

  FollowingBloc(
    this._userUsecase,
  ) : super(FollowingState()) {
    on<FollowingInitiated>(onFollowingInitiated);
  }

  void onFollowingInitiated(
      FollowingInitiated event, Emitter<FollowingState> emit) async {
    final output = await _userUsecase.getFollowUser(event.userId);
    if (event.followingType == null) {
      emit(state.copyWith(
        followeeCount: output.stats.followeeCount,
        followerCount: output.stats.followerCount,
        friendCount: output.stats.friendCount,
      ));
    } else {
      switch (event.followingType!) {
        case FollowingType.friend:
          emit(state.copyWith(friendCount: output.stats.friendCount));
        case FollowingType.follower:
          emit(state.copyWith(followerCount: output.stats.followerCount));
        case FollowingType.followee:
          emit(state.copyWith(followeeCount: output.stats.followeeCount));
      }
    }
  }
}
