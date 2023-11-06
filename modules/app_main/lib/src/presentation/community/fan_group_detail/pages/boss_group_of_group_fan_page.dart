import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../../widgets/user_information_horizontal_widget.dart';
import '../bloc/fan_group_detail_bloc.dart';

class BossGroupOfGroupFanPage extends StatelessWidget {
  const BossGroupOfGroupFanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FanGroupDetailBloc, FanGroupDetailState>(
      builder: (context, state) {
        User? boss;
        if (state is FetchBossGroupSuccess) {
          boss = state.boss.first.user;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            boss != null
                ? UserHorizontalWidget(user: boss)
                : const LoadingWidget(),
          ],
        );
      },
    );
  }
}
