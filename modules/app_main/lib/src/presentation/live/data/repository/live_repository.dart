import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_category_detail.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';

import '../../domain/entities/gift_card_list.dart';
import '../model/request/send_gift_payload.dart';
import '../model/response/join_live_response.dart';
import '../model/response/live.dart';
import '../model/response/user_point_response.dart';

abstract class LiveRepository {
  Future<Live> getListLive({
    required int page,
    required int pageSize,
    required List<String> types,
    int? categoryId,
  });

  Future<JoinLiveResponse> joinLive({required int id, String? password});

  Future<List<User>> listMembers(int id);

  Future<GiftCardList> getGiftCardList(int type);

  Future sendGift(SendGiftPayload payload);

  Future<UserPointResponse> getUserPoint();

  Future<List<LiveCategoryDetail>> listCategory();

  Future<LiveData?> createNewLive(Map<String, dynamic> json);
}
