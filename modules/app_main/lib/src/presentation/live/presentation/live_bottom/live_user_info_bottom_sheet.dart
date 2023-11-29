import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
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
import '../../../../di/di.dart';
import '../../../../domain/usecases/user_share_preferences_usecase.dart';
import '../../../marshop/widgets/gradiant_button.dart';
import '../../../shared/user/bloc/user_bloc.dart';
import '../../../social/profile/profile_bloc.dart';
import '../../../social/profile/widgets/user_info_header.dart';
import '../../../social/social_constants.dart';
import 'user_detail_intarctive.dart';

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
  final ValueNotifier<GetUserFollowDetailResponse?> _followInfo = ValueNotifier(null);
  late final _userCubit = context.read<UserCubit>();
  late User _authInfo;

  bool get isMe => _authInfo.id.toString() == widget.userId;

  @override
  void initState() {
    super.initState();
    _authInfo = _userCubit.currentUser!;
    _userCubit.onboarding();
    _userId = widget.userId;
    _userByIdBloc.add(GetDetailDataParam1Event(_userId));
    _actionBloc.getFollowUser(userId: _userId);
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
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
              showToastMessage("Yêu cầu theo dõi đã được gởi đến người bảo hộ.");
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
          if (useByIdrBloc is GetDetailDataSuccess) {
            final userInfo = useByIdrBloc.data;
            return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 10),
                  Center(
                      child: AppAvatarWidget(
                    avatar: userInfo.avatar,
                    defaultAvatar: ImageConstants.defaultUserAvatar,
                    width: 100,
                    height: 100,
                    isPDone: userInfo.isPDone,
                    border: Border.all(color: AppColors.white, width: 4),
                  )),
                  const SizedBox(height: 10),
                  _buildUserName(userInfo),
                  const SizedBox(height: 10),
                  _buildUserInfo(userInfo),
                  const SizedBox(height: 20),
                ]));
          }
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    ));
  }

  _buildUserName(User userInfo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              userInfo.getdisplayName,
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
        if (userInfo.username != null && userInfo.username!.isNotEmpty) const SizedBox(height: 3),
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

  _buildUserInfo(User userInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _buildInfomation(userInfo),
          const SizedBox(height: 10),
          _buildFriendInfo(userInfo),
          if (!isMe) const SizedBox(height: 20),
          if (!isMe) _buildProfileAction(userInfo),
        ],
      ),
    );
  }

  _buildInfomation(User userInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (userInfo.sex != null)
            Container(
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: userInfo.sex!.sexBackGroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ImageWidget(
                    userInfo.sex!.getIcon1(),
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    userInfo.old.toString(),
                    style: context.text.titleMedium
                        ?.copyWith(fontSize: 14, height: 1, color: userInfo.sex!.sexColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 5),
          Container(
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0XFF4B84F7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  "LV.1",
                  style:context.text.titleMedium
                ?.copyWith(fontSize: 14, height: 1, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          if (userInfo.joinedTeam != null) const SizedBox(width: 5),
          if (userInfo.joinedTeam != null)
            Flexible(
              child: Container(
                height: 25,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

  _buildFriendInfo(User userInfo) {
    return ValueListenableBuilder(
      valueListenable: _followInfo,
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
                    valueListenable: _friendStatus,
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

  _buildProfileAction(User userInfo) {
    final userBloc = context.watch<UserCubit>().state;
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: _followInfo,
          builder: (context, value, child) {
            if (value == null) return const SizedBox.shrink();
            final relation = value.relation;
            return Expanded(
              child: PrimarySolidButton(
                height: 40,
                title: friendStatusStr(
                  isFriend: relation.isFriend,
                  isFollowed: relation.isFollower,
                  isFollowing: false,
                  isBlocked: userInfo.isBlock,
                ),
                onTap: () => _onFriendAction(userInfo, relation),
                disabled: _getButtonStatus(userBloc is OnboardingSuccess ? userBloc.onboarding : null),
                width: null,
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PrimarySolidButton(
            height: 40,
            title: 'Trang cá nhân',
            onTap: () {
              context.startDiary(userId: widget.userId.toString());
            },
            width: null, disabled: false,
          ),
        )
      ],
    );
  }

  _onFriendAction(User userInfo, GetUserFollowRelationResponse relation) async {
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

  bool _getButtonStatus(OnBoarding? onBoarding) {
    if (_followInfo.value == null) return true;
    final followInfo = _followInfo.value!.relation;

    if (followInfo.isFollowee || followInfo.isFriend) return false;

    if (onBoarding != null) {
      if (onBoarding.isPdone && _authInfo.old > 15) return false;
      if (onBoarding.isPdone && _authInfo.old <= 15) {
        return false;
      }
    }

    return true;
  }
}
