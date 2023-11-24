import 'package:app_core/app_core.dart';

import '../../domain/entities/gift_card_list.dart';
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

  Future<UserPointResponse> getUserPoint();

}
