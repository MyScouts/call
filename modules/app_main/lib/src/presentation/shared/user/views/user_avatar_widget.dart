import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          avatar: state.currentUser?.avatar,
          size: size,
        );
      },
    );
  }
}
