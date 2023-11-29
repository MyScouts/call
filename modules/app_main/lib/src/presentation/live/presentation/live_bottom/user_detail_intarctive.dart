import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class UserDetailInteractive extends StatelessWidget {
  const UserDetailInteractive({
    super.key,
    this.following = 0,
    this.follower = 0,
    this.friend = 0,
    this.onTap,
  });

  final int following;
  final int follower;
  final int friend;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => onTap?.call(0),
          child: _ItemInteractiveSocial(
            title: 'Người hâm mộ',
            value: follower.notZero,
          ),
        )),
        Expanded(
            child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => onTap?.call(1),
          child: _ItemInteractiveSocial(
            title: 'Đang theo dõi',
            value: following.notZero,
          ),
        )),
        Expanded(
            child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => onTap?.call(2),
          child: _ItemInteractiveSocial(
            title: 'Bạn bè',
            value: friend.notZero,
          ),
        )),
      ],
    );
  }
}

class _ItemInteractiveSocial extends StatelessWidget {
  const _ItemInteractiveSocial({
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontSize: 28),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              fontSize: 12),
        ),
      ],
    );
  }
}
