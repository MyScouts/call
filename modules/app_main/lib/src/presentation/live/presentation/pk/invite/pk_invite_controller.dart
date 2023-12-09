import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_detail.dart';
import 'package:app_main/src/presentation/live/domain/usecases/live_usecases.dart';
import 'package:app_main/src/presentation/live/live_magane_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@injectable
class PkInviteController {
  final LiveUseCase useCase;

  PkInviteController(this.useCase) {
    _fetch();
  }

  final RxList<LiveDetail> _items = <LiveDetail>[].obs;

  RxList<LiveDetail> get items => _items;

  final RefreshController _controller = RefreshController();

  RefreshController get controller => _controller;

  final RxList<int> _invites = <int>[].obs;

  RxList<int> get invites => _invites;

  int page = 1;

  final RxBool _hasMore = true.obs;

  RxBool get hasMore => _hasMore;

  final RxBool _loading = true.obs;

  RxBool get loading => _loading;

  void invite(int userID) async {
    if (_invites.contains(userID)) return;
    _invites.value = [..._invites, userID];
    useCase.invitePK({
      'userIds': [userID],
      'liveId': LiveManageState.joinLive,
    });
  }

  Future _fetch() async {
    page = 1;
    final res = await useCase.getListLive(
      page: page,
      pageSize: 10,
      types: ['public'],
    );

    final lives = res.lives ?? [];

    if (lives.length < 10) _hasMore.value = false;

    _items.value = lives;

    _loading.value = false;
  }

  void loadMore() async {
    page += 1;
    final res = await useCase.getListLive(
      page: page,
      pageSize: 10,
      types: ['public'],
    );

    final lives = res.lives ?? [];

    if (lives.length < 10) _hasMore.value = false;

    _items.value = [...items, ...lives];

    _controller.loadComplete();
  }

  void refresh() async {
    _hasMore.value = true;
    await _fetch();
    _controller.refreshCompleted();
  }
}
