
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:app_main/src/data/models/responses/friend/friend_status_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'friend_api.g.dart';

class FriendApiConstant {
  static const String getFriends = 'api/v1/following/friend';
  static const String getFriendStatus = 'api/v1/following/user/{userId}';
}

@RestApi()
@injectable
abstract class FriendApi {
  @factoryMethod
  factory FriendApi(Dio dio) = _FriendApi;

  @GET(FriendApiConstant.getFriends)
  Future<FriendResponseDto> getConversations({
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });
  
  @GET(FriendApiConstant.getFriendStatus)
  Future<FriendStatusDto> getFriendStatus({
    @Path('userId') required int userId,
  });

}
