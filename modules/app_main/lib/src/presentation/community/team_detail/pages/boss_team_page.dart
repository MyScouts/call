import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

import '../../widgets/user_information_horizontal_widget.dart';

class BossTeamPage extends StatelessWidget {
  const BossTeamPage({super.key, required this.boss});

  final User? boss;

  @override
  Widget build(BuildContext context) {
    if (boss == null) {
      return const SizedBox();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserHorizontalWidget(user: boss!),
      ],
    );
  }
}
