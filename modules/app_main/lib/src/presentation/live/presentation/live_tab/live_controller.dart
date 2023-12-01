import 'package:app_main/src/presentation/live/domain/usecases/live_usecases.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/response/live.dart';
import '../../domain/entities/live_category_detail.dart';
import '../../domain/entities/live_member_count.dart';

@injectable
class LiveController {
  final LiveUseCase _useCase;

  LiveController(this._useCase);

  Rx<Live> live = const Live().obs;

  final listLiveCount = <LiveMemberCount>[].obs;

  final listCategory = <LiveCategoryDetail>[].obs;

  final listCategorySelect = <LiveCategoryDetail>[].obs;

  Future<void> getListLive() async {
    try {
      live.value = await _useCase.getListLive(
          page: 1, pageSize: 20, types: [], categoryId: listCategorySelect.map((element) => element.id!).toList());
      if (live.value.lives?.isNotEmpty == true) {
        listLiveCount.value = await _useCase.memberCount(live.value.lives!.map((e) => e.id!).toList());
      }
    } catch (e) {}
  }

  Future<void> getListCategory() async {
    try {
      listCategory.value = await _useCase.getAllCategory();
    } catch (e) {}
  }
}
