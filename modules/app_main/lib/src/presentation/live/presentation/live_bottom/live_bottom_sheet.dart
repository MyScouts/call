import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../di/di.dart';
import '../channel/state/live_channel_controller.dart';
import 'leader_board_tab.dart';
import 'live_bottom_controller.dart';

class LiveBottomSheet extends StatefulWidget {
  final LiveChannelController controller;

  const LiveBottomSheet({super.key, required this.controller});

  @override
  State<LiveBottomSheet> createState() => _LiveBottomSheetState();
}

enum TabLiveBottom { viewer, follow, rank, invite }

extension TabLiveBottomExt on TabLiveBottom {
  String get title {
    switch (this) {
      case TabLiveBottom.viewer:
        return 'Đang xem';
      case TabLiveBottom.follow:
        return 'Người follow';
      case TabLiveBottom.rank:
        return 'BXH';
      case TabLiveBottom.invite:
        return 'Mời bạn bè';
    }
  }
}

class _LiveBottomSheetState extends State<LiveBottomSheet> {
  final liveBottomController = getIt<LiveBottomController>();

  @override
  void initState() {
    liveBottomController.getLeaderBoard(widget.controller.info.id);
    super.initState();
  }

  List<Widget> get listTab => [
        Container(),
        Container(),
        LeaderBoardTab(controller: liveBottomController),
        Container(),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(16), right: Radius.circular(16)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            tabIndexView(),
            const Divider(
              thickness: 1,
              color: Color(0xffE3E3E3),
            ),
            const SizedBox(height: 16),
            Expanded(child: Obx(() => listTab[liveBottomController.tabIndex.value]))
          ],
        ),
      ),
    );
  }

  Widget tabIndexView() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: List<Widget>.generate(
              TabLiveBottom.values.length,
              (index) => GestureDetector(
                    onTap: () {
                      liveBottomController.tabIndex.value = index;
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            TabLiveBottom.values[index].title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                              width: 22,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.5),
                                  color: liveBottomController.tabIndex.value == index
                                      ? const Color(0xff9627df)
                                      : Colors.transparent))
                        ],
                      ),
                    ),
                  )),
        ),
      );
    });
  }
}
