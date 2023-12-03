import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../../../di/di.dart';
import '../widget/live_widget.dart';
import 'live_controller.dart';

class LiveScreenTab extends StatefulWidget {
  const LiveScreenTab({super.key});

  @override
  State<LiveScreenTab> createState() => _LiveScreenTabState();
}

class _LiveScreenTabState extends State<LiveScreenTab>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final liveController = getIt<LiveController>();

  @override
  void initState() {
    liveController.getListLive(context);
    liveController.getListLiveForYou(context);

    _liveTabController = TabController(length: 2, vsync: this, initialIndex: 0, animationDuration: Duration.zero);

    super.initState();
  }

  late TabController _liveTabController;

  @override
  void dispose() {
    liveController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBarGroupsLive(
            controller: _liveTabController,
          ),
          Expanded(
            child: TabBarView(controller: _liveTabController, children: [
              Obx(() {
                return RefreshIndicator(
                  onRefresh: () async {
                    liveController.getListLive(context);
                  },
                  child: GridView.count(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 7,
                    children: List.generate(liveController.live.value.lives?.length ?? 0, (index) {
                      final live = liveController.live.value.lives![index];
                      return LiveWidget(
                        liveDetail: live,
                        viewer: liveController.listLiveCount
                                .firstWhereOrNull((element) => element.liveId == live.id!)
                                ?.memberCount ??
                            0,
                      );
                    }),
                  ),
                );
              }),
              Obx(() {
                return RefreshIndicator(
                  onRefresh: () async {
                    liveController.getListLiveForYou(context);
                  },
                  child: GridView.count(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 7,
                    children: List.generate(liveController.liveForYou.value.lives?.length ?? 0, (index) {
                      final live = liveController.liveForYou.value.lives![index];
                      return LiveWidget(
                        liveDetail: live,
                        viewer: liveController.listLiveCountForYour
                                .firstWhereOrNull((element) => element.liveId == live.id!)
                                ?.memberCount ??
                            0,
                      );
                    }),
                  ),
                );
              }),
            ]),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class TabBarGroupsLive extends StatefulWidget {
  final TabController controller;

  const TabBarGroupsLive({super.key, required this.controller});

  @override
  State<TabBarGroupsLive> createState() => _TabBarGroupsLiveState();
}

class _TabBarGroupsLiveState extends State<TabBarGroupsLive> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    widget.controller.animateTo(0);
                    setState(() {});
                  },
                  child: Text(
                    'Tất cả',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: (widget.controller.index == 0) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                        ),
                  ),
                ),
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: (widget.controller.index == 0) ? const Color(0xff4b84f7) : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () {
                    widget.controller.animateTo(1);
                    setState(() {});
                  },
                  child: Text(
                    'Dành cho bạn',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: (widget.controller.index == 1) ? const Color(0xff4b84f7) : const Color(0xffacacac),
                        ),
                  ),
                ),
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: (widget.controller.index == 1) ? const Color(0xff4b84f7) : Colors.transparent,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
