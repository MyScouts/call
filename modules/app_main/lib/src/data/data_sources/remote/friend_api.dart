import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'friend_api.g.dart';

class FriendApiConstant {
  static const String getListFiend = "api/v1/following/friend";
}

@RestApi()
@injectable
abstract class FriendApi {
  @factoryMethod
  factory FriendApi(Dio dio) = _FriendApi;


  @GET(FriendApiConstant.getListFiend)
  Future<FriendResponseDto> getFriend(@Query('page') int page,@Query('pageSize') int pageSize);

}
