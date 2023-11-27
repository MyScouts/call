
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';

abstract class FriendRepository {
  Future<FriendResponseDto> getListFriend({required int page, required int pageSize});
}