import 'package:app_core/app_core.dart';

import '../model/response/join_live_response.dart';
import '../model/response/live.dart';

abstract class LiveRepository {
  Future<Live> getListLive({
    required int page,
    required int pageSize,
    required List<String> types,
    int? categoryId,
  });

  Future<JoinLiveResponse> joinLive({required int id, String? password});

  Future<List<User>> listMembers(int id);
}
