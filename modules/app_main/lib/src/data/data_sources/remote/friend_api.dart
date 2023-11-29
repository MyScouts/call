
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'friend_api.g.dart';

class FriendApiConstant {
  static const String getFriend = 'api/v1/following/friends';
}

@RestApi()
@injectable
abstract class FriendApi {
  @factoryMethod
  factory FriendApi(Dio dio) = _FriendApi;

  @GET(FriendApiConstant.getFriend)
  Future<FriendResponseDto> getConversations({
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });

}
