import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class UserFollowButtonWidget extends StatefulWidget {
  const UserFollowButtonWidget({super.key});

  @override
  State<UserFollowButtonWidget> createState() => _UserFollowButtonWidgetState();
}

class _UserFollowButtonWidgetState extends State<UserFollowButtonWidget> {
  void onTapFollow() {
    EasyDebounce.debounce(
      'deboundFollow',
      const Duration(milliseconds: 200),
      () {
        // context
        //     .read<UserBloc>()
        //     .add(AddFollowEvent(widget.user.id!, !isFollowed));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
