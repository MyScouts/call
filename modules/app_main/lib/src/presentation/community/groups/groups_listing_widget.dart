import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/groups/community/community_event_group.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../community_coordinator.dart';
import '../widgets/custom_paint.dart';
import '../widgets/group_card_widget.dart';
import 'community/community_group_widget.dart';
import 'group_listing_bloc.dart';

class GroupsListingWidget extends StatefulWidget {
  static const String routeName = 'groups-list';

  const GroupsListingWidget({super.key});

  @override
  State<GroupsListingWidget> createState() => _GroupsListingWidgetState();
}

class _GroupsListingWidgetState extends State<GroupsListingWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _onTapGroupDetail(Group group) {
    context.startGroupDetail(
      id: group.id,
      groupName: group.name,
      cover: group.avatar,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListBlockBuilderWidget<GetListGroupsBloc, Group>(
        enableRefresh: false,
        title: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.only(top: 19, bottom: 11),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const AvatarWidget(),
                    const SizedBox(width: 20),
                    const Expanded(
                        child: SearchBar(
                      hintText: 'Tim kiem',
                    )),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ImageWidget(ImageConstants.communityBanner, width: width),
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
        sliverItemsBlockBuilder: (List<Group> items) {
          return [
            SliverDecorationWidget(
              decoration: const BoxDecoration(color: AppColors.white),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Group 63 Tỉnh thành',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyTextColor,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            SliverDecorationWidget(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
              ),
            )
          ];
        },
      ),
    );
  }
}
