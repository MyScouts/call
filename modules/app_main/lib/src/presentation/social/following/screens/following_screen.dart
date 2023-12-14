import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/following/blocs/following_bloc.dart';
import 'package:app_main/src/presentation/social/following/blocs/following_event.dart';
import 'package:app_main/src/presentation/social/following/blocs/following_state.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/social_appbar_widget.dart';
import 'components/following_tab.dart';

class FollowingScreen extends StatefulWidget {
  static const String routeName = "following";

  const FollowingScreen({
    required this.user,
    required this.friendCount,
    required this.followerCount,
    required this.followeeCount,
    required this.followingType,
    super.key,
  });
  final User user;
  final int friendCount;
  final int followerCount;
  final int followeeCount;
  final FollowingType followingType;

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen>
    with TickerProviderStateMixin {
  late TabController _followingTabController;
  final bloc = getIt<FollowingBloc>();
  late User _authInfo;
  late final _userCubit = context.read<UserCubit>();

  bool get isMe => _authInfo.id.toString() == widget.user.id!.toString();

  late int friendCount;
  late int followerCount;
  late int followeeCount;

  @override
  void initState() {
    super.initState();
    _authInfo = _userCubit.currentUser!;

    _followingTabController = TabController(
      length: FollowingType.values.length,
      vsync: this,
      initialIndex: widget.followingType.index,
    );

    friendCount = widget.friendCount;
    followerCount = widget.followerCount;
    followeeCount = widget.followeeCount;

    bloc.add(FollowingInitiated(
      userId: widget.user.id!,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _followingTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayName = widget.user.getdisplayName;
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: SocialAppBarWidget(
          titleText: displayName,
        ),
        body: Column(
          children: [
            BlocBuilder<FollowingBloc, FollowingState>(
                buildWhen: (previous, current) =>
                    previous.followeeCount != current.followeeCount ||
                    previous.followerCount != current.followerCount ||
                    previous.friendCount != current.friendCount,
                builder: (context, state) {
                  return TabBar(
                    controller: _followingTabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      SizedBox(
                        width: 147.w,
                        child: Tab(
                          text:
                              'Người hâm mộ: ${state.followerCount ?? followerCount}',
                        ),
                      ),
                      SizedBox(
                        width: 143.w,
                        child: Tab(
                          text:
                              'Đang theo dõi: ${state.followeeCount ?? followeeCount}',
                        ),
                      ),
                      SizedBox(
                        width: 103.w,
                        child: Tab(
                          text: 'Bạn bè: ${state.friendCount ?? friendCount}',
                        ),
                      ),
                    ],
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: AppColors.blueEdit,
                        width: 2,
                      ),
                    ),
                    labelColor: AppColors.blueEdit,
                    labelStyle: context.text.titleMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                    unselectedLabelColor: AppColors.grey78,
                    unselectedLabelStyle: context.text.titleMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                    indicatorColor: Colors.red,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                  );
                }),
            Expanded(
              child: TabBarView(
                controller: _followingTabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  FollowingTab(
                    followingType: FollowingType.follower,
                    onUpdateTotal: () => bloc.add(FollowingInitiated(
                      userId: widget.user.id!,
                      followingType: FollowingType.follower,
                    )),
                    userId: isMe ? null : widget.user.id,
                  ),
                  FollowingTab(
                    followingType: FollowingType.followee,
                    onUpdateTotal: () => bloc.add(FollowingInitiated(
                      userId: widget.user.id!,
                      followingType: FollowingType.followee,
                    )),
                    userId: isMe ? null : widget.user.id,
                  ),
                  FollowingTab(
                    followingType: FollowingType.friend,
                    onUpdateTotal: () => bloc.add(FollowingInitiated(
                      userId: widget.user.id!,
                      followingType: FollowingType.friend,
                    )),
                    userId: isMe ? null : widget.user.id,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
