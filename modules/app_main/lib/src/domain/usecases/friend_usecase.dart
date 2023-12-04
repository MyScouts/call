
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/repository/friend_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FriendUsecase {
  final FriendRepository _repository;

  FriendUsecase(
      this._repository,
      );

  Future<FriendResponseModel> getListFriend({required int page, required int pageSize}) async {
    return await _repository.getFriends(page: page, pageSize: pageSize);
  }

}
