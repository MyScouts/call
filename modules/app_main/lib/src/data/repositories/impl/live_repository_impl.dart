import 'package:app_core/src/domain/entities/user/user.dart';
import 'package:app_main/src/data/data_sources/remote/live_api.dart';
import 'package:app_main/src/data/models/responses/live/join_live_response.dart';
import 'package:app_main/src/data/repositories/live_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LiveRepository)
class LiveRepositoryImpl extends LiveRepository {
  final LiveAPI liveAPI;

  LiveRepositoryImpl(this.liveAPI);

  @override
  Future<JoinLiveResponse> joinLive({
    required int id,
    String? password,
  }) async {
    final res = await liveAPI.joinLive(id: id, password: password);
    return res.data;
  }

  @override
  Future<List<User>> listMembers(int id) async {
    final res = await liveAPI.getListMemberLive(id: id);
    return res.data.members;
  }
}
