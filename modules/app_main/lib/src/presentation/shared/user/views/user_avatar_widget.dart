import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../bloc/user_bloc.dart';

class UserAvatarWidget extends StatelessWidget {
  final double size;

  const UserAvatarWidget({
    super.key,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return AvatarWidget(
          avatar: state.currentUser?.getAvatar,
          size: size,
        );
      },
    );
  }
}
