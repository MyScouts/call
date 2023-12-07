import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/live/domain/usecases/live_usecases.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/response/live.dart';
import '../../domain/entities/live_category_detail.dart';
import '../../domain/entities/live_member_count.dart';

@injectable
class LiveController {
  final LiveUseCase _useCase;

  LiveController(this._useCase) {
    NotificationCenter.subscribe(
      channel: refreshLive,
      observer: this,
      onNotification: (options) {
        //getListLive();
      },
    );
  }

  Rx<Live> live = const Live().obs;

  Rx<Live> liveForYou = const Live().obs;

  final listLiveCount = <LiveMemberCount>[].obs;

  final listLiveCountForYour = <LiveMemberCount>[].obs;

  final listCategory = <LiveCategoryDetail>[].obs;

  final listCategorySelect = <LiveCategoryDetail>[].obs;

  Future<void> getListLive(BuildContext context) async {
    try {
      live.value = await _useCase.getListLive(
        page: 1,
        pageSize: 20,
        types: ['public'],
        categoryId: listCategorySelect.map((element) => element.id!).toList(),
      );
      if (live.value.lives?.isNotEmpty == true) {
        listLiveCount.value = await _useCase
            .memberCount(live.value.lives!.map((e) => e.id!).toList());
      }
      if (live.value.lives?.isEmpty == true) {
        if (context.mounted) {
          context.showNoticeDialog(
              title: 'Không có live nào phù hợp với yêu cầu');
        }
      }
    } catch (e) {}
  }

  Future<void> getListLiveForYou(BuildContext context) async {
    try {
      liveForYou.value = await _useCase.getListLivefollowing(
          page: 1, pageSize: 20, isFriend: false);
      if (liveForYou.value.lives?.isNotEmpty == true) {
        listLiveCountForYour.value = await _useCase
            .memberCount(liveForYou.value.lives!.map((e) => e.id!).toList());
      }
    } catch (e) {}
  }

  Future<void> getListCategory() async {
    try {
      listCategory.value = await _useCase.getAllCategory();
    } catch (e) {}
  }

  void close() {
    NotificationCenter.unsubscribe(channel: refreshLive, observer: this);
  }
}
