import 'package:app_core/app_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/models/responses/list_followees_response.dart';
import '../../../../domain/usecases/user_usecase.dart';
import '../../data/model/request/invite_friend_req.dart';
import '../../data/model/response/data_get_invite_friend.dart';
import '../../data/model/response/gift_card_live.dart';
import '../../domain/usecases/live_usecases.dart';

@injectable
class LiveBottomController {
  final LiveUseCase useCase;

  final tabIndex = 0.obs;

  final giftCardLiveDaily = const GiftCardLive().obs;

  final giftCardLive = const GiftCardLive().obs;

  final UserUsecase userUsecase;

  LiveBottomController(this.useCase, this.userUsecase);

  final textController = TextEditingController();

  Future<void> getLeaderBoard(int roomId) async {
    try {
      giftCardLiveDaily.value = await useCase.getInfoGiftCard(roomId);
    } catch (e) {}
  }

  Future<void> getDailyDedications(int userId) async {
    try {
      giftCardLiveDaily.value = await useCase.getDailyDedications(userId);
    } catch (e) {}
  }

  Future<void> getDedications(int userId) async {
    try {
      giftCardLive.value = await useCase.getDedications(userId);
    } catch (e) {}
  }

  final listFriends = <User>[].obs;

  final listFollow = <FolloweesUser>[].obs;

  Future<void> getListFriend() async {
    try {
      listFriends.value = await userUsecase.listFriends();
    } catch (e) {}
  }

  Future<void> getListFollow() async {
    try {
      listFollow.value = await userUsecase.listFollowees();
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
