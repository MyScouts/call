import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

import '../bloc/user_bloc.dart';

class UserCover extends StatelessWidget {
  final double? borderRadius;
  final double? size;

  const UserCover({
    Key? key,
    this.borderRadius,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return ImageWidget(
            state.userInfo.backgroundImages?.first ?? ImageConstants.imgdefault,
            borderRadius: borderRadius,
            width: size,
            height: size,
          );
        }
        return const SizedBox();
      },
    );
  }
}
