import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/data/data_sources/remote/live_api.dart';
import 'package:injectable/injectable.dart';

import '../../model/response/join_live_response.dart';
import '../../model/response/live.dart';
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
}
