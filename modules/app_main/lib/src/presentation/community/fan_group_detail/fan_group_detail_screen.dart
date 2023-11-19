import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:app_main/src/presentation/shared/user/bloc/user_bloc.dart';
import 'package:design_system/design_system.dart';
// import 'package:ecommerce/ecommerce.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

import '../community_coordinator.dart';
import '../group_detail/group_detail_constants.dart';
import '../widgets/dropdown_menu_option_widget.dart';
import 'bloc/fan_group_detail_bloc.dart';
import 'fan_group_detail_constants.dart';

class FanGroupDetailScreen extends StatefulWidget {
  static const String routeName = '/fan-group-detail';

  const FanGroupDetailScreen({super.key, required this.fanGroup});

  final FanGroup fanGroup;

  @override
  State<FanGroupDetailScreen> createState() => _FanGroupDetailScreenState();
}

class _FanGroupDetailScreenState extends State<FanGroupDetailScreen>
    with TickerProviderStateMixin {
  late final TabController _tabCtrl;
  FanGroupDetailBloc get detailBloc => context.read();
  FanGroup get fanGroupInit => widget.fanGroup;

  void _onPressRegister() {
    // if (!context.isPDone) {
    //   context.startDialogUpgradeKYC();
    //   return;
    // }

    if (fanGroupInit.id != null) {
      showLoading();
      detailBloc.add(RegisterFanGroupEvent(fanGroupInit.id!));
    }
  }

  void _onListenerFanGroupDetailBloc(
      BuildContext context, FanGroupDetailState state) {
    if (state is RegisterTeamSuccess) {
      hideLoading();
      context.showToastMessage('Đăng ký thành công');
      // context.startStateDialog(
      //     title: 'Yêu cầu tham gia của bạn đang được xét duyệt');
      context.read<UserBloc>().add(FetchUserInfoEvent());
    } else if (state is FetchFanGroupSuccess) {
      hideLoading();
    }
  }

  void _onTapEdit(FanGroup? fanGroup) {
    if (fanGroup == null) {
      return;
    }

    context.startEditFanGroup(fanGroup).then((value) {
      if (value != null && value is bool && value) {
        detailBloc.add(FetchFanGroupDetailEvent(fanGroupInit.id!));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabCtrl =
        TabController(length: FanGroupDetailTab.values.length, vsync: this);
    if (fanGroupInit.id != null) {
      showLoading();
      detailBloc.add(FetchFanGroupDetailEvent(fanGroupInit.id!));
    }
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, stateUser) {
          final userInfoFanGroup = stateUser.currentUser?.fanGroup;
          final currentUserId = stateUser.currentUser?.id;

          return BlocConsumer<FanGroupDetailBloc, FanGroupDetailState>(
            listener: _onListenerFanGroupDetailBloc,
            builder: (context, state) {
              FanGroup? fanGroup;

              // if (state is LoadingFanGroupDetail) {
              //   return const LoadingWidget();
              // }

              if (state is FetchFanGroupSuccess) {
                fanGroup = state.fanGroup;
              }
              if (state is UpdateFanGroupSucccess) {
                fanGroup = state.fanGroup;
              }
              var banner = ImageConstants.imgdefault;
              if (fanGroup?.banner != null) {
                banner = fanGroup!.banner!.optimizeSize600;
              }

              return SliverLayoutNestedScrollView(
                cover: ImageWidget(
                  banner,
                  width: MediaQuery.of(context).size.width,
                ),
                actionAppBar: currentUserId == fanGroup?.boss?.id
                    ? DropdownMenuOptionWidget(
                        onChanged: (type) {
                          if (type == GroupDetailAction.edit) {
                            _onTapEdit(fanGroup);
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
                                  fanGroup?.avatar ??
                                      ImageConstants.defaultAvatar,
                                  width: 100,
                                  height: 100,
                                  borderRadius: 50,
                                ),
                              ),
                            ),
                            if (fanGroup?.name?.isNotEmpty ?? false)
                              Text(
                                fanGroup?.name ?? '',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            if (fanGroup?.contests?.isNotEmpty ?? false)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFF1F0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                margin: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 12,
                                ),
                                child: Text(
                                  fanGroup?.currentProccess ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: const Color(0xffF84C70)),
                                ),
                              ),
                            if (userInfoFanGroup == null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: GradiantButton(
                                  onPressed: _onPressRegister,
                                  child: const Text('Đăng ký tham gia Team'),
                                ),
                              ),
                            if (userInfoFanGroup != null &&
                                userInfoFanGroup.status == 0)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 159, 67, 0.1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                margin: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Đang chờ duyệt',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: const Color(0xffFF9F43)),
                                ),
                              ),
                            if (fanGroup?.introduction?.isNotEmpty ?? false)
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 27),
                                child: Text(fanGroup?.introduction ?? ''),
                              ),
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: false,
                        delegate: _StickyTabBarDelegate(
                          TabBar(
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
                            tabs: FanGroupDetailTab.values.map(
                              (e) {
                                var memberCount = 0;
                                if (e == FanGroupDetailTab.bossGroup) {
                                  memberCount = fanGroup?.totalBossGroup ?? 0;
                                }
                                if (e == FanGroupDetailTab.bossTeam) {
                                  memberCount = fanGroup?.totalBossTeam ?? 0;
                                }
                                if (e == FanGroupDetailTab.member) {
                                  memberCount = fanGroup?.totalMember ?? 0;
                                }
                                return Tab(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 4),
                                    child: Text(
                                      e.text(context, totalMember: memberCount),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      if (fanGroup != null)
                        SliverFillRemaining(
                          child: TabBarView(
                            controller: _tabCtrl,
                            children: FanGroupDetailTab.values
                                .map((e) => e.build(context, fanGroup!))
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
