import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/data/model/response/live_pk_stats.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_category_detail.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_pk_data.dart';

import '../../domain/entities/gift_card_list.dart';
import '../../domain/entities/live_member_count.dart';
import '../model/request/invite_friend_req.dart';
import '../model/response/data_get_invite_friend.dart';
import '../model/response/gift_card_live.dart';
import '../model/response/join_live_response.dart';
import '../model/response/live.dart';
import '../model/response/user_point_response.dart';

abstract class LiveRepository {
  Future<Live> getListLive({
    required int page,
    required int pageSize,
    required List<String> types,
    List<int>? categoryId,
  });

  Future<JoinLiveResponse> joinLive({required int id, String? password});

  Future<List<User>> listMembers(int id);

  Future<GiftCardList> getGiftCardList(int type);

  Future sendGift(
      {required int userId,
      required int liveId,
      required int giftId,
      required int total});

  Future<GiftCardLive> getInfoGiftCard(int liveID);

  Future<GiftCardLive> getLiveState(int liveID);

  Future<GiftCardLive> getDailyDedications(int userId);

  Future<GiftCardLive> getDedications(int userId);

  Future<UserPointResponse> getUserPoint();

  Future<List<LiveCategoryDetail>> listCategory();

  Future<LiveData?> createNewLive(Map<String, dynamic> json);

  Future<bool> endLive({required int liveId});

  Future<DataGetInviteFriend> getInviteFriend({
    int? page,
    int? pageSize,
    required bool isFriend,
  });

  Future<dynamic> inviteFriend(String liveId, InviteFriendReq user);

  Future<List<LiveMemberCount>> memberCount(List<int> liveIDs);

  Future<Live> getListLivefollowing({
    required int page,
    required int pageSize,
    required bool isFriend,
  });

  Future<bool> checkPass(int liveId, String password);

  Future<bool> invitePK(Map<String, dynamic> json);

  Future<bool> acceptPK(Map<String, dynamic> json);

  Future deletePK(int id);

  Future<LivePkData> getPk(int id);

  Future updatePk(int pkId, bool enableShareMessage);

  Future startGame(Map<String, dynamic> json);

  Future readyGame(int id);

  Future<List<LivePkStats>> getStats(int pkID);

  Future deleteGame(int pkID);
}
