import 'package:app_main/src/data/data_sources/remote/friend_api.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_status_model.dart';
import 'package:app_main/src/domain/repository/friend_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FriendRepository)
class FriendRepositoryImpl extends FriendRepository {
  final FriendApi _friendApi;

  FriendRepositoryImpl(
    this._friendApi,
  );
  @override
  Future<FriendResponseModel> getFriends(
      {required int page, required int pageSize}) async {
    return await _friendApi.getConversations(page: page, pageSize: pageSize);
  }

  @override
  Future<FriendStatusModel> getFriendStatus({required int userId}) async {
    return await _friendApi.getFriendStatus(userId: userId);
  }
}
