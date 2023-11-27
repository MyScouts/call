
import 'package:app_main/src/core/networking/api_response.dart';
import 'package:app_main/src/data/data_sources/remote/friend_api.dart';
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:app_main/src/domain/repository/friend_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FriendRepository)
class FriendRepositoryImpl extends FriendRepository {
  final FriendApi _client;

  FriendRepositoryImpl(this._client);

  @override
  Future<FriendResponseDto> getListFriend({required int page, required int pageSize}) async {
    try {
      return await _client.getFriend(page, pageSize);
    } catch (e) {
      rethrow;
    }
  }

}