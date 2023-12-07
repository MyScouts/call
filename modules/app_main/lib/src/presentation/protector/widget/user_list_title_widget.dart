import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class UserListTitleWidget extends StatelessWidget {
  const UserListTitleWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppAvatarWidget(
          avatar: user.avatar,
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user.getdisplayName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'ID: ${user.pDoneId ?? ''}',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Color(0xffACACAC),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
