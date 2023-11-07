import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user_action/user_action_cubit.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:app_main/src/presentation/social/social_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class UserInfoHeader extends StatefulWidget {
  final User userInfo;
  final ValueNotifier<bool> friendStatusCtrl;
  final bool isMe;
  const UserInfoHeader({
    super.key,
    required this.userInfo,
    required this.friendStatusCtrl,
    this.isMe = false,
  });

  @override
  State<UserInfoHeader> createState() => _UserInfoHeaderState();
}

class _UserInfoHeaderState extends State<UserInfoHeader> {
  late User _userInfo;
  @override
  void initState() {
    super.initState();
    _userInfo = widget.userInfo;
    widget.friendStatusCtrl.value = widget.userInfo.isFollowed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(children: [
        _buildBgAvatar(),
        const SizedBox(height: 60),
        _buildUserName(),
        const SizedBox(height: 10),
        _buildUserInfo(),
      ]),
    );
  }

  _buildBgAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ImageWidget(
          ImageConstants.defaultUserBackground,
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.white, width: 5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ImageWidget(
                  ImageConstants.defaultUserAvatar,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
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

  _buildUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              widget.userInfo.getdisplayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.text.titleMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            if (widget.userInfo.getIsPDone)
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
        if (widget.userInfo.username != null &&
            widget.userInfo.username!.isNotEmpty)
          const SizedBox(height: 3),
        if (widget.userInfo.username != null &&
            widget.userInfo.username!.isNotEmpty)
          Text(
            "(${widget.userInfo.username})",
            style: context.text.titleSmall!.copyWith(
              color: AppColors.grey14,
            ),
          ),
        const SizedBox(height: 3),
        Text(
          "ID: ${widget.userInfo.pDoneId}",
          style: context.text.titleSmall!.copyWith(),
        )
      ],
    );
  }

  _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _buildInfomation(),
          const SizedBox(height: 10),
          _buildFriendInfo(),
          if (!widget.isMe) const SizedBox(height: 20),
          if (!widget.isMe) _buildProfileAction(),
        ],
      ),
    );
  }

  _buildInfomation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.userInfo.sex != null)
            Container(
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0XFFFFEDF8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ImageWidget(widget.userInfo.sex!.getIcon()),
                  Text(
                    widget.userInfo.old.toString(),
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
          if (widget.userInfo.joinedTeam != null) const SizedBox(width: 5),
          if (widget.userInfo.joinedTeam != null)
            Expanded(
              child: Container(
                height: 25,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0XFFECF5FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 25,
                      child: CircleAvatar(),
                    ),
                    Expanded(
                      child: Text(
                        widget.userInfo.joinedTeam!.name!,
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

  _buildFriendInfo() {
    final isFollowed = widget.userInfo.isFollowed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: widget.friendStatusCtrl,
                builder: (context, value, child) {
                  int totalFollower = widget.userInfo.totalFollower;
                  if (isFollowed == !value && !widget.userInfo.isFriend!) {
                    if (value) {
                      totalFollower += 1;
                    } else {
                      totalFollower -= 1;
                    }
                  }
                  return Text(
                    totalFollower.toString(),
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
                widget.userInfo.totalFollowing.toString(),
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
                widget.userInfo.totalFriend.toString(),
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
  }

  _buildProfileAction() {
    final userInfo = widget.userInfo;
    final isFriend = userInfo.isFriend ?? false;
    final isFollowing = userInfo.isFollowing ?? false;
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: widget.friendStatusCtrl,
          builder: (context, value, child) {
            return Expanded(
              flex: 2,
              child: PrimarySolidButton(
                height: 40,
                title: friendStatusStr(
                  isFriend: isFriend,
                  isFollowed: value,
                  isFollowing: isFollowing,
                  isBlocked: _userInfo.isBlock,
                ),
                onTap: _onFriendAction,
                disabled: false,
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
            final result =
                await context.showDiaryActions(userInfo: widget.userInfo);
            if (result != null) {
              widget.friendStatusCtrl.value = result.isFollowed ?? false;
              _userInfo = _userInfo.copyWith(
                isBlock: true,
                isFollowed: false,
                isFollowing: false,
              );
            }
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

  _onFriendAction() async {
    if (widget.friendStatusCtrl.value) {
      final result = await context.showFriendActions(
        userInfo: widget.userInfo.copyWith(
          isFollowed: widget.friendStatusCtrl.value,
        ),
      );
      if (result != null && result is User) {
        widget.friendStatusCtrl.value = result.isFollowed ?? false;
      }
    } else {
      context
          .read<UserActionCubit>()
          .followUser(payload: FollowUserPayload(id: widget.userInfo.id!));
    }
  }
}
