import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class TeamMemberWidget extends StatelessWidget {
  final User user;
  final Widget? trailing;

  const TeamMemberWidget({
    super.key,
    required this.user,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarWidget(avatar: user.avatar),
      contentPadding: EdgeInsets.zero,
      title: Text(
        user.getdisplayName,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
      ),
      subtitle: Text(
        'ID: ${user.pDoneId}',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontSize: 15,
            color: const Color(0xFFACACAC)),
      ),
      trailing: trailing,
    );
  }
}
