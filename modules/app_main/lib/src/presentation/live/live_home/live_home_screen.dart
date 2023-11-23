import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../widget/tab-bar-groups.dart';

class LiveHomeScreen extends StatefulWidget {
  static const String routeName = "/live_home";

  const LiveHomeScreen({super.key});

  @override
  State<LiveHomeScreen> createState() => _LiveHomeScreenState();
}

class _LiveHomeScreenState extends State<LiveHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _liveTabController;

  @override
  void initState() {
    _liveTabController = TabController(length: 3, vsync: this, initialIndex: 1, animationDuration: Duration.zero);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _liveTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(toolbarHeight: 0,elevation: 0,toolbarOpacity: 0),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          animationDuration: Duration.zero,
          child: ColoredBox(
            color: AppColors.bgColor,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.startDiary(),
                        child: const AppAvatarWidget(),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            style: context.text.titleMedium!.copyWith(color: Colors.grey),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              isDense: false,
                              hintText: "Tìm kiếm...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(Icons.search, color: AppColors.grey14),
                              fillColor: const Color(0XFFF2F2F2),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          //onPressed: () => context.startCommunityNotification(),
                          icon: ImageWidget(IconAppConstants.bell),
                          highlightColor: Colors.transparent, onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => context.startDashboardUtil(),
                          icon: const Icon(Icons.close),
                          highlightColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                TabBarGroups(controller: _liveTabController),
                Expanded(
                  child: TabBarView(
                    controller: _liveTabController,
                    children: [Container(), Container(),Container()],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
