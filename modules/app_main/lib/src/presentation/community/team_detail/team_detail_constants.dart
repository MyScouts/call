import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

import 'pages/boss_team_page.dart';
import 'pages/list_members_page.dart';
import 'pages/team_mission_page.dart';

enum TeamDetailTab {
  bossTeam,
  member,
  mission,
}

extension TeamDetailTabBuilder on TeamDetailTab {
  String text(BuildContext context, {int totalMember = 0}) {
    switch (this) {
      case TeamDetailTab.bossTeam:
        return 'Boss Team';
      case TeamDetailTab.member:
        return 'Thành viên Team: $totalMember/100';
      case TeamDetailTab.mission:
        return 'Nhiệm vụ Team';
    }
  }

  Widget build(BuildContext context, Team team) {
    switch (this) {
      case TeamDetailTab.bossTeam:
        return BossTeamPage(boss: team.boss);
      case TeamDetailTab.member:
        return const ListMembersPage();
      case TeamDetailTab.mission:
        return const TeamMissionPage();
    }
  }
}
