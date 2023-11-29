import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/request/invite_friend_req.dart';
import '../../data/model/response/data_get_invite_friend.dart';
import '../../data/model/response/gift_card_live.dart';
import '../../domain/usecases/live_usecases.dart';

@injectable
class LiveBottomController {
  final LiveUseCase useCase;

  final tabIndex = 0.obs;

  final giftCardLive = const GiftCardLive().obs;

  final dataGetInviteFriend = DataGetInviteFriend().obs;

  LiveBottomController(this.useCase);

  Future<void> getLeaderBoard(int roomId) async {
    try {
      giftCardLive.value = await useCase.getInfoGiftCard(roomId);
    } catch (e) {}
  }

  Future<void> getListFriend() async {
    try {
      dataGetInviteFriend.value = await useCase.getListInviteFriend(isFriend: true, page: 1, pageSize: 100);
    } catch (e) {}
  }

  Future<void> inviteFriend(String id, List<int> userIds) async {
    try {
      await useCase.inviteFriend(
          liveId: id.toString(),
          user: InviteFriendReq(
            userIds: userIds,
          ));
    } catch (e) {}
  }
}
