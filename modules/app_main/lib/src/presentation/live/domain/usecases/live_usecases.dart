import 'package:injectable/injectable.dart';

import '../../data/model/request/send_gift_payload.dart';
import '../../data/model/response/data_get_invite_friend.dart';
import '../../data/model/response/gift_card_live.dart';
import '../../data/model/response/live.dart';
import '../../data/model/response/user_point_response.dart';
import '../../data/repository/live_repository.dart';
import '../entities/gift_card_list.dart';

@injectable
class LiveUseCase {
  final LiveRepository _liveRepository;

  LiveUseCase(this._liveRepository);

  Future<Live> getListLive({
    required int page,
    required int pageSize,
    required List<String> types,
    int? categoryId,
  }) {
    return _liveRepository.getListLive(
      page: page,
      pageSize: pageSize,
      types: types,
      categoryId: categoryId,
    );
  }

  Future<GiftCardList> getGiftCardList(int type) {
    return _liveRepository.getGiftCardList(type);
  }

  Future sendGift({required int userId, required int liveId, required int giftId, required int total}) {
    return _liveRepository.sendGift(userId: userId, liveId: liveId, giftId: giftId, total: total);
  }

  Future<UserPointResponse> getUserPoint() {
    return _liveRepository.getUserPoint();
  }

  Future<GiftCardLive> getInfoGiftCard(int liveId) async {
    return _liveRepository.getInfoGiftCard(liveId);
  }

  Future<DataGetInviteFriend> getListInviteFriend({
    int? page,
    int? pageSize,
    required bool isFriend,
  }) async {
    return _liveRepository.getInviteFriend(
      page: page,
      pageSize: pageSize,
      isFriend: isFriend,
    );
  }
}
