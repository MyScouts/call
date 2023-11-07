import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/groups/community/community-tab-bar.dart';
import 'package:app_main/src/presentation/community/groups/community/community_group_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../community_coordinator.dart';
import '../widgets/group_card_widget.dart';
import 'group_listing_bloc.dart';

class GroupsListingWidget extends StatefulWidget {
  static const String routeName = 'groups-list';

  const GroupsListingWidget({super.key});

  @override
  State<GroupsListingWidget> createState() => _GroupsListingWidgetState();
}

class _GroupsListingWidgetState extends State<GroupsListingWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  void _onTapGroupDetail(Group group) {
    context.startGroupDetail(
      id: group.id,
      groupName: group.name,
      cover: group.avatar,
    );
  }

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<Group> groupsCommunity = [
    Group(banner: ImageConstants.communityLuatSu, name: 'Cộng đồng luật sư', id: '1'),
    Group(banner: ImageConstants.communityXayDung, name: 'Cộng đồng kiến trúc', id: '2'),
    Group(banner: ImageConstants.communityDuLich, name: 'Cộng đồng du lịch',  id: '3'),
    Group(banner: ImageConstants.communityViecLam, name: 'Cộng đồng việc làm',  id: '4'),
    Group(
        banner: ImageConstants.communityTruyenThong,
        name: 'Cộng đồng truyền thông'),
    Group(
        banner: ImageConstants.communityNgheThuat,
        name: 'Cộng đồng nghệ thuật'),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: ColoredBox(
        color: AppColors.bgColor,
        child: ListBlockBuilderWidget<GetListGroupsBloc, Group>(
          enableRefresh: false,
          title: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(top: 19, bottom: 11),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            // child: Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10),
            //       child:
            //           ImageWidget(ImageConstants.communityBanner, width: width),
            //     ),
            //     const SizedBox(height: 20),
            //     CommunityTabBar(controller: _tabController),
            //     CommunityGroupWidget(
            //       groups: groupsCommunity,
            //       onTap: _onTapGroupDetail,
            //     ),
            //     // Padding(
            //     //   padding: const EdgeInsets.only(top: 15),
            //     //   child: BlocBuilder<GetFanGroupBloc, GetDetailState>(
            //     //     builder: (context, state) {
            //     //       FanGroup? fanGroup;
            //     //       if (state is GetDetailDataSuccess<FanGroup>) {
            //     //         fanGroup = state.data;
            //     //       }
            //     //
            //     //       return ConstrainedBox(
            //     //         constraints: const BoxConstraints(maxHeight: 200),
            //     //         child: GestureDetector(
            //     //           onTap: () {
            //     //             if (fanGroup != null) {
            //     //               context.startFanGroupDetail(fanGroup);
            //     //             }
            //     //           },
            //     //           child: ImageWidget(
            //     //             ImageConstants.bannerFanDanca,
            //     //             width: width,
            //     //           ),
            //     //         ),
            //     //       );
            //     //     },
            //     //   ),
            //     // ),
            //   ],
            // ),
          ),
          sliverItemsBlockBuilder: (List<Group> items) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                      ImageWidget(ImageConstants.communityBanner, width: width),
                    ),
                    const SizedBox(height: 20),
                    CommunityTabBar(controller: _tabController),
                    CommunityGroupWidget(
                      groups: items,
                      onTap: _onTapGroupDetail,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 15),
                    //   child: BlocBuilder<GetFanGroupBloc, GetDetailState>(
                    //     builder: (context, state) {
                    //       FanGroup? fanGroup;
                    //       if (state is GetDetailDataSuccess<FanGroup>) {
                    //         fanGroup = state.data;
                    //       }
                    //
                    //       return ConstrainedBox(
                    //         constraints: const BoxConstraints(maxHeight: 200),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             if (fanGroup != null) {
                    //               context.startFanGroupDetail(fanGroup);
                    //             }
                    //           },
                    //           child: ImageWidget(
                    //             ImageConstants.bannerFanDanca,
                    //             width: width,
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Text(
                    'Group 63 Tỉnh thành',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyTextColor,
                        ),
                  ),
                ),
              ),
              SliverDecorationWidget(
                decoration: const BoxDecoration(color: AppColors.white),
                sliver: SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12)
                      .copyWith(bottom: 10),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GroupCardWidget(
                          group: items[index],
                          onTap: _onTapGroupDetail,
                        );
                      },
                      childCount: items.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                  ),
                ),
              )
            ];
          },
        ),
      ),
    );
  }
}
