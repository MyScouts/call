import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../../shared/user/bloc/user_bloc.dart';
import '../../upgrade_account/upgrade_account_coordinator.dart';
import '../community_constants.dart';
import '../community_coordinator.dart';
import '../group_detail/group_detail_constants.dart';
import '../widgets/dropdown_menu_option_widget.dart';
import 'bloc/team_detail_bloc.dart';
import 'team_detail_constants.dart';

class TeamDetailScreen extends StatefulWidget {
  static const String routeName = '/team';

  const TeamDetailScreen({
    super.key,
    required this.id,
    this.cover,
    this.name,
  });

  final int id;
  final String? name;
  final String? cover;

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen>
    with TickerProviderStateMixin {
  late final TabController _tabCtrl;
  User? get currentUser => context.read<UserBloc>().state.currentUser;
  String? get currUserId => currentUser?.pDoneId;
  bool get isJA => currentUser?.isPDone == true && currentUser?.isJA == true;
  TeamDetailBloc get teamDetailBloc => context.read();

  void _onTapRegisterTeam(Team team) {
    final user = context.read<UserBloc>().state.currentUser;
    if (user?.isPDone == false) {
      // context.startDialogUpgradeKYC();
    } else {
      context.startUpgradeJA(team: team);
    }
  }

  void _onTapEdit(Team team) {
    final boss = team.boss;

    context
        .startEditInformation(
            community: Community.copyWithTeam(team), type: CommunityType.team)
        .then((value) {
      if (value != null && value is Team) {
        teamDetailBloc.add(UpdateTeamDetailEvent(value.copyWith(boss: boss)));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: TeamDetailTab.values.length, vsync: this);
    teamDetailBloc.add(FetchTeamDetailEvent(widget.id));
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UpgradeAccountSuccess) {
            context.startDialogUpgradeAccountSuccess(widget.name ?? '');
          }
        },
        builder: (context, state) {
          return BlocBuilder<TeamDetailBloc, TeamDetailState>(
            builder: (context, state) {
              Team? team;
              int memberCount = 0;

              if (state is LoadingTeamDetail) {
                return const LoadingWidget();
              }

              if (state is FetchTeamDetailSuccess) {
                team = state.team;
              }
              if (state is FetchTeamsMemberSuccess) {
                memberCount = state.members.length;
              }

              var banner = ImageConstants.imgdefault;
              if (team?.banner != null) {
                banner = team!.banner!.optimizeSize600;
              }

              return SliverLayoutNestedScrollView(
                cover: ImageWidget(
                  banner,
                  width: MediaQuery.of(context).size.width,
                ),
                actionAppBar: currUserId == team?.boss?.pDoneId
                    ? DropdownMenuOptionWidget(
                        onChanged: (type) {
                          if (type == GroupDetailAction.edit) {
                            _onTapEdit(team!);
                          }
                        },
                      )
                    : null,
                bodyBuilder: (ScrollController scrollController) {
                  return CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ImageWidget(
                                  team?.avatar ?? ImageConstants.defaultAvatar,
                                  width: 100,
                                  height: 100,
                                  borderRadius: 50,
                                ),
                              ),
                            ),
                            if (team?.name?.isNotEmpty ?? false)
                              Text(
                                team?.name ?? '',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            if (team?.codeId?.isNotEmpty ?? false)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5)
                                    .copyWith(bottom: !isJA ? 20 : 0),
                                child: GestureDetector(
                                  onTap: () => copyText('${team?.codeId}'),
                                  child: Text(
                                    'ID: ${team?.codeId}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF828282),
                                        ),
                                  ),
                                ),
                              ),
                            if (team != null)
                              !isJA
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28.0),
                                      child: GradiantButton(
                                        onPressed: () {
                                          _onTapRegisterTeam(team!);
                                        },
                                        child:
                                            const Text('Đăng ký tham gia Team'),
                                      ),
                                    )
                                  : const SizedBox(),
                            // if (team?.introduction?.isNotEmpty ?? false)
                            team?.introduction?.isNotEmpty ?? false
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 27),
                                    child: Text(team?.introduction ?? ''),
                                  )
                                : const SizedBox(height: 27),
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: false,
                        delegate: _StickyTabBarDelegate(TabBar(
                          controller: _tabCtrl,
                          isScrollable: true,
                          labelPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          indicator: TabIndicatorDecoration(
                            width: 8,
                            weight: 3,
                            color: AppColors.blue11,
                          ),
                          labelColor: AppColors.blue15,
                          unselectedLabelColor: AppColors.black10,
                          indicatorColor: AppColors.blue11,
                          labelStyle: Theme.of(context).textTheme.titleSmall,
                          unselectedLabelStyle: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                          tabs: TeamDetailTab.values
                              .map((e) => Tab(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 4),
                                      child: Text(e.text(context,
                                          totalMember: memberCount)),
                                    ),
                                  ))
                              .toList(),
                        )),
                      ),
                      if (team != null)
                        SliverFillRemaining(
                          child: TabBarView(
                            controller: _tabCtrl,
                            children: TeamDetailTab.values
                                .map((e) => e.build(context, team!))
                                .toList(),
                          ),
                        ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
