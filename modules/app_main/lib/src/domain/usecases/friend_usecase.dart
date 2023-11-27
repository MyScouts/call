
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:app_main/src/domain/repository/friend_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FriendUsecase {
  final FriendRepository _repository;

  FriendUsecase(
      this._repository,
      );

  Future<FriendResponseDto> getListFriend({required int page, required int pageSize}) async {
    return await _repository.getListFriend(page: page, pageSize: pageSize);
  }

}
