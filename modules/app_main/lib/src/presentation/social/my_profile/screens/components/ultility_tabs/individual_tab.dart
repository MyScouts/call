import 'package:app_main/src/presentation/social/my_profile/screens/components/medial_tabs/post_tab.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/medial_tabs/reels_tab.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/medial_tabs/video_tab.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../widgets/medial_tab_bar.dart';

class IndividualTab extends StatefulWidget {
  const IndividualTab({super.key});

  @override
  State<IndividualTab> createState() => _IndividualTabState();
}

class _IndividualTabState extends State<IndividualTab>
    with TickerProviderStateMixin {
  late TabController _medialTabController;

  final List<Widget> _medialTabsView = [
    PostTab(
      key: PageStorageKey('post-tab'),
    ),
    VideoTab(
      key: PageStorageKey('video-tab'),
    ),
    ReelsTab(
      key: PageStorageKey('reels-tab'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    initTab();
  }

  @override
  void dispose() {
    super.dispose();
    _medialTabController.dispose();
  }

  void initTab() {
    _medialTabController = TabController(
      length: _medialTabsView.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverAppBar(
          floating: true,
          pinned: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: MedialTabBar(controller: _medialTabController),
          centerTitle: false,
          elevation: 0,
          leadingWidth: 0,
          toolbarHeight: 64,
          primary: false,
          leading: const SizedBox.shrink(),
          shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoScaleTabBarView(
                  controller: _medialTabController,
                  children: [
                    PostTab(
                      key: PageStorageKey('post-tab'),
                    ),
                    VideoTab(
                      key: PageStorageKey('video-tab'),
                    ),
                    ReelsTab(
                      key: PageStorageKey('reels-tab'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
