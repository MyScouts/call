import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/blocs/user_action/user_action_cubit.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:app_main/src/presentation/social/social_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

// class UserInfoHeader extends StatefulWidget {

//   @override
//   State<UserInfoHeader> createState() => _UserInfoHeaderState();
// }

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
    this.isMe = false,
    required this.followInfoCtrl,
    required this.authInfo,
    required this.onBoarding,
  });

  bool _getButtonStatus() {
    // if (followInfoCtrl.value == null) return true;
    // final followInfo = followInfoCtrl.value!.relation;

    // if (followInfo.isFollowee || followInfo.isFriend) return false;

    // if (onBoarding != null) {
    //   if (onBoarding!.isPdone && authInfo.old > 15) return false;
    //   if (onBoarding!.isPdone && authInfo.old <= 15) {
    //     return false;
    //   }
    // }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {},
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(children: [
          _buildBgAvatar(context),
          const SizedBox(height: 60),
          _buildUserName(context),
          const SizedBox(height: 10),
          _buildUserInfo(context),
        ]),
      ),
    );
  }

  _buildBgAvatar(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CachedNetworkImage(
          height: 180,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          imageUrl: userInfo.defaultBackground ?? "",
          errorWidget: (context, url, error) {
            return ImageWidget(
              ImageConstants.defaultUserBackground,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: Center(
              child: AppAvatarWidget(
            avatar: userInfo.avatar,
            defaultAvatar: ImageConstants.defaultUserAvatar,
            width: 100,
            height: 100,
            isPDone: userInfo.isPDone,
            border: Border.all(color: AppColors.white, width: 4),
          )),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top,
          left: paddingHorizontal,
          right: paddingHorizontal,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBackButton(color: AppColors.white),
              CustomCloseButton(color: AppColors.white),
            ],
          ),
        )
      ],
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
            Container(
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0XFFFFEDF8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ImageWidget(userInfo.sex!.getIcon()),
                  Text(
                    userInfo.old.toString(),
                    style: context.text.titleMedium,
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
                  style: context.text.titleMedium!
                      .copyWith(color: AppColors.white),
                ),
              ],
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
                disabled: _getButtonStatus(),
                width: null,
              ),
            );
          },
        ),
        // const SizedBox(width: 10),
        // CommonOutlineButton(
        //   height: 40,
        //   onPressed: () {},
        //   label: "Nhắn tin",
        // ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => context.startQrCode(userInfo: userInfo),
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0XFFE8F0FE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ImageWidget(
              IconAppConstants.icQrCode,
            ),
          ),
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
