import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/data/data_sources/remote/live_api.dart';
import 'package:app_main/src/presentation/live/data/model/response/gift_card_live.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_category_detail.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/gift_card_list.dart';
import '../../model/response/join_live_response.dart';
import '../../model/response/live.dart';
import '../../model/response/user_point_response.dart';
import '../live_repository.dart';

@Injectable(as: LiveRepository)
class LiveRepositoryImpl extends LiveRepository {
  final LiveApi _liveApi;

  LiveRepositoryImpl(this._liveApi);

  @override
  Future<Live> getListLive({
    required int page,
    required int pageSize,
    required List<String> types,
    int? categoryId,
  }) async {
    final result = await _liveApi.getListLive(
      page: page,
      pageSize: pageSize,
      types: types,
      categoryId: categoryId,
    );
    return result.data;
  }

  @override
  Future<JoinLiveResponse> joinLive({
    required int id,
    String? password,
  }) async {
    final res = await _liveApi.joinLive(id: id, password: password);
    return res.data;
  }

  @override
  Future<List<User>> listMembers(int id) async {
    final res = await _liveApi.getListMemberLive(id: id);
    return res.data.members;
  }

  @override
  Future<GiftCardList> getGiftCardList(int type) async {
    final result = await _liveApi.getGiftCardList(type);
    return result.data;
  }

  @override
  Future sendGift({required int userId, required int liveId, required int giftId, required int total}) async {
    return _liveApi.sendGift(userId,liveId,giftId,total);
  }

  @override
  Future<UserPointResponse> getUserPoint() async {
    final result = await _liveApi.getUserPoint();
    return result.data;
  }

  @override
  Future<List<LiveCategoryDetail>> listCategory() async {
    final res = await _liveApi.getAllCateGory();
    return res.data.categories ?? [];
  }

  @override
  Future<LiveData?> createNewLive(Map<String, dynamic> json) async {
    final res = await _liveApi.createNewLive(json);
    if (!res.success) return null;
    return res.data;
  }

  @override
  Future<GiftCardLive> getInfoGiftCard(int liveID) async {
    final result = await _liveApi.getInfoGiftCard(liveId: liveID);
    return result.data;
  }

  Future<bool> endLive({required int liveId}) async {
    final res = await _liveApi.endLive(liveId: liveId);
    return res.data;
  }
}
