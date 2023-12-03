import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../di/di.dart';
import '../widget/live_widget.dart';
import 'live_controller.dart';

class LiveStreamSearch extends StatefulWidget {
  static const String routeName = "/live_stream_search";

  const LiveStreamSearch({super.key});

  @override
  State<LiveStreamSearch> createState() => _LiveStreamSearchState();
}

class _LiveStreamSearchState extends State<LiveStreamSearch> {
  final liveController = getIt<LiveController>();

  @override
  void initState() {
    liveController.getListLive(context);
    liveController.getListCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Hủy',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
        leading: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () async {
              await context.showFilterSearchLive(liveController);
              liveController.getListLive(context);
            },
            child: Obx(() {
              return ImageWidget(
                liveController.listCategorySelect.isEmpty ? IconAppConstants.icFilter : IconAppConstants.icFilterTick,
                color: const Color(0xff4B84F7),
                height: 30,
                width: 30,
              );
            }),
          ),
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            style: context.text.titleMedium!.copyWith(color: Colors.grey),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: false,
              hintText: "Tìm kiếm tên / ID / Ph...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffE9E9E9)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffE9E9E9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              prefixIcon: const Icon(Icons.search, color: AppColors.grey14),
              // fillColor: const Color(0XFFF2F2F2),
              // filled: true,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Dành cho bạn',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              return RefreshIndicator(
                onRefresh: () async {
                  liveController.getListLive(context);
                },
                child: GridView.count(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
          )
        ],
      ),
    );
  }
}
