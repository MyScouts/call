import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/following/blocs/following_tab_bloc.dart';
import 'package:app_main/src/presentation/social/following/blocs/following_tab_event.dart';
import 'package:app_main/src/presentation/social/following/blocs/following_tab_state.dart';
import 'package:app_main/src/presentation/social/following/following_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../../../my_profile/screens/widgets/profile_avatar.dart';
import '../../../widgets/social_refresher.dart';

class FollowingTab extends StatefulWidget {
  const FollowingTab({
    required this.followingType,
    required this.onUpdateTotal,
    required this.userId,
    super.key,
  });
  final FollowingType followingType;
  final Function onUpdateTotal;
  final int? userId;

  @override
  State<FollowingTab> createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab>
    with AutomaticKeepAliveClientMixin {
  final bloc = getIt<FollowingTabBloc>();
  late User _authInfo;
  late final _userCubit = context.read<UserCubit>();

  int get currentUserId => _authInfo.id!;

  @override
  void initState() {
    super.initState();
    _authInfo = _userCubit.currentUser!;

    bloc.add(FollowingTabInitiated(
        followingType: widget.followingType, userId: widget.userId));
    widget.onUpdateTotal();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<FollowingTabBloc, FollowingTabState>(
          buildWhen: (previous, current) =>
              previous.hasLoadMore != current.hasLoadMore ||
              previous.followingType != current.followingType,
          builder: (context, state) {
            return SocialRefresher(
              controller: bloc.controller,
              onRefresh: () {
                widget.onUpdateTotal();
                bloc.add(FollowingTabRefreshed());
              },
              onLoading: () => bloc.add(FollowingTabLoadMore()),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: _buildSearch(),
                      ),
                      BlocBuilder<FollowingTabBloc, FollowingTabState>(
                          buildWhen: (previous, current) =>
                              previous.followingInfo != current.followingInfo,
                          builder: (context, state) {
                            if (state.isInitial()) {
                              return const LoadingWidget();
                            }

                            if (state.isEmpty()) {
                              return const SizedBox.shrink();
                            }

                            return Column(
                              children: state.followingInfo!.info!
                                  .map((e) => _buildUser(e))
                                  .toList(),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildUser(FollowingRelationUser followingRelationUser) {
    final followingUser = followingRelationUser.user;
    final followingRelation = followingRelationUser.relation;

    final followingUserType = FollowingUserType.type(followingUser.getType);
    final displayName =
        followingUser == null ? 'Người bí ẩn' : followingUser.getDisplayName;

    return GestureDetector(
      onTap: (){
        context.startDiary(userId: followingUser.getUserId.toString());
      },
      child: Container(
        height: 68.h,
        margin: const EdgeInsets.only(bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileAvatar(
              avatarUrl: followingUser.getAvatar,
              size: 44,
              isPDone: followingUserType.isPDone,
              fontSize: 12,
              profileTypePadding: 2,
              avatarPadding: 3,
              backgroundColor: AppColors.blueEdit,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    displayName,
                    style: context.text.titleMedium!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    followingUser.getPDoneId,
                    style: context.text.titleSmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (followingUser != null && followingRelation != null)
              _buildButtonByType(
                followingRelation: followingRelation,
                followingUser: followingUser,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonByType({
    required FollowingRelation followingRelation,
    required FollowingUser followingUser,
  }) {
    final textStyle = context.text.titleSmall!.copyWith(
      fontSize: 12,
      color: AppColors.white,
    );

    final isMe = currentUserId == followingUser.getUserId;

    if (followingRelation.isBlocked || followingRelation.isBlocking || isMe) {
      return const SizedBox.shrink();
    }

    if (followingRelation.hasPendingApproval) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.gray50,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          'Theo dõi',
          style: textStyle.copyWith(color: AppColors.gray500),
        ),
      );
    }

    if (followingRelation.isFriend) {
      return GestureDetector(
        onTap: () {
          bloc.add(UnfriendUserTapped(followingUser: followingUser));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.gray50,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check,
                size: 14,
                color: AppColors.gray500,
              ),
              const SizedBox(width: 4),
              Text(
                'Bạn bè',
                style: textStyle.copyWith(color: AppColors.gray500),
              ),
            ],
          ),
        ),
      );
    }

    if (followingRelation.isFollowee) {
      return GestureDetector(
        onTap: () {
          bloc.add(FollowUserTapped(followingUser: followingUser));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.blueEdit,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            'Theo dõi',
            style: textStyle,
          ),
        ),
      );
    }

    if (followingRelation.isFollower) {
      return GestureDetector(
        onTap: () {
          bloc.add(UnfollowUserTapped(followingUser: followingUser));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.gray50,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            'Đang theo dõi',
            style: textStyle.copyWith(color: AppColors.gray500),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        bloc.add(FollowUserTapped(followingUser: followingUser));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.blueEdit,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          'Theo dõi',
          style: textStyle,
        ),
      ),
    );
  }

  Widget _buildSearch() {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
    return TextField(
      style: context.text.bodySmall!.copyWith(color: AppColors.grey20),
      onChanged: (text) {
        bloc.add(FollowingUserSearch(query: text));
      },
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ImageWidget(
            IconAppConstants.icSearch,
            color: Colors.grey,
            fit: BoxFit.cover,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(maxHeight: 30),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        hintText: "Tìm kiếm",
        hintStyle: context.text.titleMedium!.copyWith(
          color: AppColors.grey20,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: AppColors.grey81,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
