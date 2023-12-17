import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';

abstract class FollowingEvent {}

class FollowingInitiated extends FollowingEvent {
  final int userId;
  final FollowingType? followingType;

  FollowingInitiated({
    required this.userId,
    this.followingType,
  });
}
