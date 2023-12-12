import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class VideoAppbarWidget extends StatelessWidget {
  const VideoAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(context);
  }

  Widget _buildAppBar(BuildContext context) {
    final double paddingTop = statusBarHeight > 0 ? statusBarHeight - 4 : 10;
    return Container(
      height: kToolbarHeight,
      margin: EdgeInsets.only(top: paddingTop, left: 3),
      color: Colors.transparent,
      child: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.white,
        ),
      ),
    );
  }
}