import '../model/response/live.dart';

abstract class LiveRepository {
  Future<Live> getListLive({
    required int page,
    required int pageSize,
    required List<String> types,
    int? categoryId,
  });
}
