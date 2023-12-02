import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/authentication/authentication_coordinator.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/live/live_wrapper_screen.dart';
import 'package:app_main/src/presentation/settings/setting_coordinator.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../../app_main.dart';
import '../../../../blocs/user/user_cubit.dart';
import '../../../community/widgets/circle_image.dart';
import '../live_tab/live_home_search.dart';
import '../live_tab/live_screen_tab.dart';
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
    _liveTabController = TabController(length: 3, vsync: this, initialIndex: 0, animationDuration: Duration.zero);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _liveTabController.dispose();
  }

  bool get authenticate => isAuthenticate.value;

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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!authenticate) {
                            context.requiredLogin();
                            return;
                          }
                          context.startSetting();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: BlocBuilder<UserCubit, UserState>(
                            builder: (_, state) {
                              if (state.currentUser?.avatar?.trim().isEmpty ?? false) {
                                return Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.theme.primaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: ClipRRect(
                                    child: ImageWidget(
                                      ImageConstants.defaultUserAvatar,
                                      borderRadius: 100,
                                    ),
                                  ),
                                );
                              }
                              return CircleNetworkImage(
                                url: context.read<UserCubit>().currentUser?.avatar ?? '',
                                size: 40,
                                defaultImage: ImageWidget(
                                  ImageConstants.defaultUserAvatar,
                                  borderRadius: 100,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(child: TabBarGroups(controller: _liveTabController)),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          //onPressed: () => context.startCommunityNotification(),
                          icon: ImageWidget(
                            IconAppConstants.icSearch,
                            color: const Color(0xff4B84F7),
                          ),
                          highlightColor: Colors.black,
                          onPressed: () {
                            Navigator.pushNamed(context, LiveStreamSearch.routeName);
                          },
                        ),
                      ),
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
                Expanded(
                  child: TabBarView(
                    controller: _liveTabController,
                    children: [const LiveScreenTab(), Container(), Container()],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(LiveWrapperScreen.routerName);
        },
        behavior: HitTestBehavior.opaque,
        child: SizedBox.square(
          dimension: 70,
          child: ImageWidget(IconAppConstants.icCreateLive),
        ),
      ),
    );
  }
}
