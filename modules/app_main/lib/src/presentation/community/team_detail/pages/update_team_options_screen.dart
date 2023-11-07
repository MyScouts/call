import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../community_constants.dart';

class UpdateTeamOptionsScreen extends StatelessWidget {
  final Team team;
  static const String routeName = '/update-team-options';

  const UpdateTeamOptionsScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '${team.name}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Column(
        children: UpdateTeamOption.values
            .map(
              (option) => Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderColor),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ListTile(
                  title: Text(
                    option.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: option.textColor,
                        ),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                  onTap: () => option.onTap(context, team: team),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
