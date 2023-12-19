import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../../../blocs/user/user_cubit.dart';
import '../../../../blocs/user_action/user_action_cubit.dart';
import '../../../../data/models/payloads/user/user_action_payload.dart';
import '../../../../data/models/responses/follow_response.dart';
import '../../../social/profile/profile_bloc.dart';
import '../../../social/social_constants.dart';

class LiveUserInfoBottomView extends StatefulWidget {
  const LiveUserInfoBottomView({super.key, required this.userId});

  final int userId;

  @override
  State<LiveUserInfoBottomView> createState() => _LiveUserInfoBottomViewState();
}

class _LiveUserInfoBottomViewState extends State<LiveUserInfoBottomView> {
  late int _userId;
  final ValueNotifier<bool> _friendStatus = ValueNotifier(false);
  final UserActionCubit _actionBloc = injector.get<UserActionCubit>();

  GetUserByIdBloc get _userByIdBloc => context.read<GetUserByIdBloc>();
  final ValueNotifier<GetUserFollowDetailResponse?> _followInfo =
      ValueNotifier(null);
  late final _userCubit = context.read<UserCubit>();
  late User _authInfo;

  bool get isMe => _authInfo.id.toString() == widget.userId.toString();

  @override
  void initState() {
    super.initState();
    _authInfo = _userCubit.currentUser!;
    _userCubit.getOnboarding();
    _userId = widget.userId;
    _userByIdBloc.add(GetDetailDataParam1Event(_userId));
    _actionBloc.getFollowUser(userId: _userId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => _actionBloc,
      child: BlocListener<UserActionCubit, UserActionState>(
        listener: (context, state) {
          if (state is GetFollowUserSuccess) {
            _followInfo.value = state.followDetail;
          }

          if (state is OnFollowUser || state is OnUnFollow) {
            showLoading();
          }
          if (state is FollowUserSuccess) {
            hideLoading();
            _friendStatus.value = true;
            if (state.approvalRequired) {
              showToastMessage(
                  "Yêu cầu theo dõi đã được gởi đến người bảo hộ.");
            } else {
              showToastMessage("Theo dõi người dùng thành công.");
            }
          }

          if (state is FollowUserFail) {
            hideLoading();
            showToastMessage(state.message, ToastMessageType.error);
          }

          if (state is UnFollowSuccess) {
            hideLoading();
            _friendStatus.value = false;
            showToastMessage("Bỏ theo dõi người dùng thành công.");
          }

          if (state is UnFollowFail) {
            hideLoading();
            _friendStatus.value = false;

            showToastMessage(state.message, ToastMessageType.error);
          }
        },
        child: Builder(builder: (context) {
          final useByIdrBloc = context.watch<GetUserByIdBloc>().state;
          final userBloc = context.watch<UserCubit>().state;
          if (useByIdrBloc is GetDetailDataSuccess) {
            final userInfo = useByIdrBloc.data;
            return UserInfoHeader(
              userInfo: userInfo,
              friendStatusCtrl: _friendStatus,
              followInfoCtrl: _followInfo,
              authInfo: _authInfo,
              isMe: isMe,
              onBoarding:
                  userBloc is OnboardingSuccess ? userBloc.onboarding : null,
            );
          }
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    ));
  }
}

class UserInfoHeader extends StatelessWidget {
  final User userInfo;
  final User authInfo;
  final ValueNotifier<bool> friendStatusCtrl;
  final bool isMe;
  final ValueNotifier<GetUserFollowDetailResponse?> followInfoCtrl;
  final OnBoarding? onBoarding;

  const UserInfoHeader({
    super.key,
    required this.userInfo,
    required this.friendStatusCtrl,
    required this.isMe,
    required this.followInfoCtrl,
    required this.authInfo,
    required this.onBoarding,
  });

  bool _getButtonStatus({required GetUserFollowRelationResponse relation}) {
    if (relation.hasPendingApproval != null && relation.hasPendingApproval!) {
      return true;
    }
    if (onBoarding != null) {
      if (onBoarding!.isPdone && authInfo.old <= 15) {}
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector.get<GlobalPersonSettingBloc>()
        ..add(GetDetailDataParam1Event(userInfo.id)),
      child: BlocListener<UserCubit, UserState>(
        listener: (context, state) {},
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 24),
            Center(
                child: AppAvatarWidget(
              avatar: userInfo.avatar,
              defaultAvatar: ImageConstants.defaultUserAvatar,
              width: 136,
              height: 136,
              isPDone: userInfo.isPDone,
              border: Border.all(color: AppColors.white, width: 4),
            )),
            const SizedBox(height: 6),
            _buildUserName(context),
            const SizedBox(height: 10),
            _buildUserInfo(context),
          ]),
        ),
      ),
    );
  }

  _buildUserName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              userInfo.getDisplayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.text.titleMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            if (userInfo.getIsPDone)
              Positioned(
                right: -25,
                bottom: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: const Color(0xFF4B84F7),
                  child: Text(
                    "P",
                    style: context.text.titleSmall!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
          ],
        ),
        if (userInfo.username != null && userInfo.username!.isNotEmpty)
          const SizedBox(height: 3),
        if (userInfo.username != null && userInfo.username!.isNotEmpty)
          Text(
            "(${userInfo.username})",
            style: context.text.titleSmall!.copyWith(
              color: AppColors.grey14,
            ),
          ),
        const SizedBox(height: 3),
        Text(
          "ID: ${userInfo.pDoneId}",
          style: context.text.titleSmall!.copyWith(),
        )
      ],
    );
  }

  _buildUserInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _buildInfomation(context),
          const SizedBox(height: 10),
          _buildFriendInfo(context),
          if (!isMe) const SizedBox(height: 20),
          if (!isMe) _buildProfileAction(context),
        ],
      ),
    );
  }

  _buildInfomation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (userInfo.sex != null)
            IntrinsicHeight(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0XFFFFEDF8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ImageWidget(
                      userInfo.sex!.getIcon(),
                      height: 15,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      userInfo.old.toString(),
                      style: context.text.titleSmall!.copyWith(height: 0),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(width: 5),
          IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0XFF4B84F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "LV.1",
                    style: context.text.titleSmall!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (userInfo.joinedTeam != null) const SizedBox(width: 5),
          if (userInfo.joinedTeam != null)
            Flexible(
              child: Container(
                height: 25,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0XFFECF5FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 25,
                      child: CircleAvatar(),
                    ),
                    Flexible(
                      child: Text(
                        userInfo.joinedTeam!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.titleMedium,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 10,
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  _buildFriendInfo(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: followInfoCtrl,
      builder: (context, value, child) {
        if (value == null) {
          return const SizedBox.shrink();
        }
        final stats = value.stats;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: friendStatusCtrl,
                    builder: (context, value, child) {
                      return Text(
                        stats.followerCount.toString(),
                        style: context.text.titleMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Người hâm mộ",
                    style: context.text.titleMedium,
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    stats.followeeCount.toString(),
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Đang theo dõi",
                    style: context.text.titleMedium,
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              width: 1,
              color: Colors.grey,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    stats.friendCount.toString(),
                    style: context.text.titleMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Bạn bè",
                    style: context.text.titleMedium,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  _buildProfileAction(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: followInfoCtrl,
          builder: (context, value, child) {
            if (value == null) return const SizedBox.shrink();
            final relation = value.relation;
            return Expanded(
              flex: 2,
              child: PrimarySolidButton(
                height: 40,
                title: friendStatusStr(
                  isFriend: relation.isFriend,
                  isFollower: relation.isFollower,
                  isFollowee: relation.isFollowee,
                  isBlocked: userInfo.isBlock,
                ),
                onTap: () => _onFriendAction(context, relation),
                disabled: _getButtonStatus(relation: relation),
                width: null,
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        CommonOutlineButton(
          height: 40,
          onPressed: () {},
          label: "Nhắn tin",
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () async {
            context.showDiaryActions(userInfo: userInfo).then((result) {
              if (result != null) {
                context
                    .read<UserActionCubit>()
                    .getFollowUser(userId: userInfo.id!);
              }
            });
          },
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0XFFE8F0FE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ImageWidget(
              IconAppConstants.icFlag,
              color: context.theme.primaryColor,
            ),
          ),
        )
      ],
    );
  }

  _onFriendAction(
      BuildContext context, GetUserFollowRelationResponse relation) async {
    if (!relation.isFollower) {
      context.read<UserActionCubit>().followUser(
            payload: FollowUserPayload(followeeId: userInfo.id!),
          );
    } else {
      context
          .showFriendActions(
        userInfo: userInfo.copyWith(
          isFollowed: relation.isFollower,
          isFriend: relation.isFriend,
        ),
      )
          .then((value) {
        if (value != null && value is User) {
          context.read<UserActionCubit>().getFollowUser(userId: userInfo.id!);
        }
      });
    }
  }
}
