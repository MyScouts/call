
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_status_model.dart';

abstract class FriendRepository {
  Future<FriendResponseModel> getFriends({
    required int page,
    required int pageSize,
  });

  Future<FriendStatusModel> getFriendStatus({
    required int userId,
  });
}