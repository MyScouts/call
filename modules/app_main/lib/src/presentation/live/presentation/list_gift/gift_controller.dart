import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/generated/l10n.dart';

import '../../data/model/response/user_point_response.dart';
import '../../domain/entities/gift_card_list.dart';
import '../../domain/usecases/live_usecases.dart';

@injectable
class GiftController {
  final giftType = GiftType.gift.obs;

  final indexSelectCommon = 0.obs;

  final amount = 0.obs;

  final LiveUseCase _useCase;

  GiftController(this._useCase);

  final giftCardList = const GiftCardList().obs;

  final userPointResponse = const UserPointResponse().obs;

  Future<void> getListGiftCard() async {
    try {
      giftCardList.value = await _useCase.getGiftCardList(giftType.value.type);
    } catch (e) {}
  }

  Future<void> getUserPoint() async {
    try {
      userPointResponse.value = await _useCase.getUserPoint();
    } catch (e) {}
  }

  Future<void> sentGift({
    required int userId,
    required int liveId,
    required int giftId,
  }) async {
    try {
      await _useCase.sendGift(userId: userId, liveId: liveId, giftId: giftId, total: amount.value);
    } catch (e) {}
  }
}

final List<int> listAmount = [1, 10, 99, 100, 999];

enum GiftType {
  gift(1),
  vote(2);

  final int type;

  const GiftType(this.type);
}

extension GiftTypeExt on GiftType {
  String get title {
    switch (this) {
      case GiftType.gift:
        return S.current.gift;
      case GiftType.vote:
        return S.current.vote;
    }
  }
}
