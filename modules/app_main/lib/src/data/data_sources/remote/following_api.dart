import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'following_api.g.dart';

class FollowingApiConstants {
  static const String followers = 'api/v1/following/followers';
  static const String followees = 'api/v1/following/followees';
  static const String friend = 'api/v1/following/friend';
  static const String userFollowers =
      'api/v1/following/user/{userId}/followers';
  static const String userFollowees =
      'api/v1/following/user/{userId}/followees';
  static const String userFriend = 'api/v1/following/user/{userId}/friend';
}

@RestApi()
@injectable
abstract class FollowingAPI {
  @factoryMethod
  factory FollowingAPI(Dio dio) = _FollowingAPI;

  @GET(FollowingApiConstants.followers)
  Future<FollowingFollowers> getFollowers(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('query') String? query,
    @Query('excludeFriend') bool excludeFriend,
  );

  @GET(FollowingApiConstants.followees)
  Future<FollowingFollowees> getFollowees(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('query') String? query,
    @Query('excludeFriend') bool excludeFriend,
  );

  @GET(FollowingApiConstants.friend)
  Future<FollowingFriends> getFriends(
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('query') String? query,
  );

  @GET(FollowingApiConstants.userFollowers)
  Future<FollowingUserFollowers> getUserFollowers(
    @Path('userId') int userId,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('query') String? query,
    @Query('excludeFriend') bool excludeFriend,
  );

  @GET(FollowingApiConstants.userFollowees)
  Future<FollowingUserFollowees> getUserFollowees(
    @Path('userId') int userId,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('query') String? query,
    @Query('excludeFriend') bool excludeFriend,
  );

  @GET(FollowingApiConstants.userFriend)
  Future<FollowingUserFriends> getUserFriends(
    @Path('userId') int userId,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('query') String? query,
  );
}
