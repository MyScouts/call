import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/community/groups/groups_listing_widget.dart';
import 'package:app_main/src/presentation/community/groups/widget/tab-bar-groups.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../blocs/user/user_cubit.dart';

class CommunityWidget extends StatefulWidget {
  static const String routeName = 'community';

  const CommunityWidget({super.key});

  @override
  State<CommunityWidget> createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends State<CommunityWidget>
    with SingleTickerProviderStateMixin {
  late TabController _communityTabController;

  @override
  void initState() {
    _communityTabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: 1,
        animationDuration: Duration.zero);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _communityTabController.dispose();
  }

  late final myId = context.read<UserCubit>().currentUser?.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(toolbarHeight: 0,elevation: 0,toolbarOpacity: 0),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
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
                        onTap: () => context.startDiary(userId: myId.toString()),
                        child: const AppAvatarWidget(),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            style: context.text.titleMedium!
                                .copyWith(color: Colors.grey),
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
                              prefixIcon: const Icon(Icons.search,
                                  color: AppColors.grey14),
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
                          onPressed: () => context.startCommunityNotification(),
                          icon: ImageWidget(IconAppConstants.bell),
                          highlightColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                          highlightColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                TabBarGroups(controller: _communityTabController),
                Expanded(
                  child: TabBarView(
                    controller: _communityTabController,
                    children: [
                      Container(),
                      MultiBlocProvider(
                        providers: [
                          BlocProvider<GetListGroupsBloc>(
                            create: (context) =>
                                injector.get()..add(GetListDataEvent()),
                          ),
                          BlocProvider<GetFanGroupBloc>(
                            create: (context) => injector.get(),
                          )
                        ],
                        child: const GroupsListingWidget(),
                      )
                    ],
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
