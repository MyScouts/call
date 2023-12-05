import 'package:app_main/src/presentation/live/presentation/live_bottom/list_follow_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../di/di.dart';
import '../channel/state/live_channel_controller.dart';
import 'leader_board_tab.dart';
import 'list_friend_tab.dart';
import 'live_bottom_controller.dart';
import 'viewer_tab.dart';

class LiveBottomSheet extends StatefulWidget {
  final LiveChannelController controller;
  final int? index;

  const LiveBottomSheet({super.key, required this.controller, this.index});

  @override
  State<LiveBottomSheet> createState() => _LiveBottomSheetState();
}

enum TabLiveBottom {
  viewer,
  invite,
  // follow,
  rank,
}

extension TabLiveBottomExt on TabLiveBottom {
  String get title {
    switch (this) {
      case TabLiveBottom.viewer:
        return 'Số người xem';
      // case TabLiveBottom.follow:
      //   return 'Người follow';
      case TabLiveBottom.rank:
        return 'Bảng cống hiến';
      case TabLiveBottom.invite:
        return 'Mời bạn bè';
    }
  }

  double? get height {
    switch (this) {
      case TabLiveBottom.viewer:
        return 450;
      case TabLiveBottom.rank:
        return 650;
      case TabLiveBottom.invite:
        return 450;
    }
  }
}

class _LiveBottomSheetState extends State<LiveBottomSheet> {
  final liveBottomController = getIt<LiveBottomController>();

  @override
  void initState() {
    if (widget.index != null) {
      liveBottomController.tabIndex.value = widget.index!;
    }
    //liveBottomController.getLeaderBoard(widget.controller.info.id);
    liveBottomController.getDailyDedications(widget.controller.info.user!.id!);
    liveBottomController.getDedications(widget.controller.info.user!.id!);
    liveBottomController.getListFriend();
    liveBottomController.getListFollow();
    super.initState();
  }

  List<Widget> get listTab => [
        ViewerTab(
          controller: widget.controller,
          liveBottomController: liveBottomController,
        ),
        ListFriendTab(controller: liveBottomController, liveData: widget.controller.info),
        //ListFollowTab(controller: liveBottomController, liveData: widget.controller.info),
        LeaderBoardTab(controller: liveBottomController),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Container(
          height: TabLiveBottom.values[liveBottomController.tabIndex.value].height,
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
        );
      }),
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
                          Obx(() {
                            final viewerCount = widget.controller.members.length;
                            final color = liveBottomController.tabIndex.value == index
                                ? const Color(0xff4B84F7)
                                : const Color(0xff8C8C8C);
                            if (TabLiveBottom.values[index] == TabLiveBottom.viewer) {
                              return Text(
                                '${TabLiveBottom.values[index].title} $viewerCount',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
                              );
                            }
                            return Text(
                              TabLiveBottom.values[index].title,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
                            );
                          }),
                          const SizedBox(height: 4),
                          Container(
                              width: 22,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.5),
                                  color: liveBottomController.tabIndex.value == index
                                      ? const Color(0xff4B84F7)
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
