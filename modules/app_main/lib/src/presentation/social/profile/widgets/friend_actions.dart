import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user_action/user_action_cubit.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class FriendMenuActions extends StatefulWidget {
  final User userInfo;
  const FriendMenuActions({
    super.key,
    required this.userInfo,
  });

  @override
  State<FriendMenuActions> createState() => _FriendMenuActionsState();
}

class _FriendMenuActionsState extends State<FriendMenuActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: paddingHorizontal,
        right: paddingHorizontal,
        bottom: 50,
      ),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: .1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CloseButton(),
                  ),
                ),
                Text(
                  widget.userInfo.getdisplayName,
                  style: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => context.read<UserActionCubit>().unFollow(
                  payload: UnFollowPayload(followeeId: widget.userInfo.id!),
                ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.userInfo.isFriend!
                            ? "Huỷ bạn bè"
                            : "Bỏ theo dõi",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontSize: 15,
                          color: AppColors.red500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
