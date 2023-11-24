import 'package:injectable/injectable.dart';

import '../../data/model/response/live.dart';
import '../../data/repository/live_repository.dart';

@injectable
class LiveUseCase {
  final LiveRepository _liveRepository;

  LiveUseCase(this._liveRepository);

  Future<Live> getListLive({
    required int page,
    required int pageSize,
    required List<String> types,
    int? categoryId,
  }) {
    return _liveRepository.getListLive(
      page: page,
      pageSize: pageSize,
      types: types,
      categoryId: categoryId,
    );
  }
}
