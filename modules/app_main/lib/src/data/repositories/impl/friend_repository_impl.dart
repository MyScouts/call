import 'package:app_main/src/data/data_sources/remote/friend_api.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
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
}
