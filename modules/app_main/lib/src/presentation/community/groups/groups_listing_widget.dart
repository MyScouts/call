import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

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
  void initState() {
    super.initState();
    context.read<GetFanGroupBloc>().add(GetDetailDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final width = MediaQuery.of(context).size.width;

    return ListBlockBuilderWidget<GetListGroupsBloc, Group>(
      enableRefresh: false,
      title: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(top: 19, bottom: 11),
        child: Column(
          children: [
            ImageWidget(
              ImageConstants.communityBanner,
              width: width,
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
      sliverItemsBlockBuilder: (List<Group> items) {
        final groupProvincial = <Group>[];
        final groupNonProvincial = <Group>[];

        for (final group in items) {
          if (group.isProvincialGroup ?? false) {
            groupProvincial.add(group);
          } else {
            groupNonProvincial.add(group);
          }
        }

        return [
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: CommunityGroupWidget(
                groups: groupNonProvincial,
                onTap: _onTapGroupDetail,
              ),
            ),
          ),
          SliverDecorationWidget(
            decoration: const BoxDecoration(color: Color(0xffE1F0FF)),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
                  decoration: StepperDecoration(
                    showShadown: true,
                    color: const Color(0xff8CA8F6),
                  ),
                  child: Text(
                    'Group 63 Tỉnh thành',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
          SliverDecorationWidget(
            decoration: const BoxDecoration(
              color: Color(0xffE1F0FF),
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 10),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GroupCardWidget(
                      group: groupProvincial[index],
                      onTap: _onTapGroupDetail,
                    );
                  },
                  childCount: groupProvincial.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            ),
          )
        ];
      },
    );
  }
}
