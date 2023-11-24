import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../di/di.dart';
import '../widget/live_widget.dart';
import 'live_controller.dart';

class LiveScreenTab extends StatefulWidget {
  const LiveScreenTab({super.key});

  @override
  State<LiveScreenTab> createState() => _LiveScreenTabState();
}

class _LiveScreenTabState extends State<LiveScreenTab> with AutomaticKeepAliveClientMixin {
  final liveController = getIt<LiveController>();

  @override
  void initState() {
    liveController.getListLive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      return GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 7,
        children: List.generate(liveController.live.value.total ?? 0, (index) {
          return LiveWidget(liveDetail: liveController.live.value.lives![index]);
        }),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
