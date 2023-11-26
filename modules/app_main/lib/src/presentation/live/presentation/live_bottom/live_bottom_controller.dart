import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/response/gift_card_live.dart';
import '../../domain/usecases/live_usecases.dart';

@injectable
class LiveBottomController {
  final LiveUseCase useCase;

  final tabIndex = 0.obs;

  final giftCardLive = const GiftCardLive().obs;

  LiveBottomController(this.useCase);

  Future<void> getLeaderBoard(int roomId) async {
    try {
      giftCardLive.value = await useCase.getInfoGiftCard(roomId);
    } catch (e) {}
  }
}
