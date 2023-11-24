import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/live/join_live_response.dart';

abstract class LiveRepository {
  Future<JoinLiveResponse> joinLive({required int id, String? password});

  Future<List<User>> listMembers(int id);
}