import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

import 'pages/boss_group_of_group_fan_page.dart';
import 'pages/boss_teams_of_group_fan_page.dart';
import 'pages/members_of_group_fan_page.dart';

enum FanGroupDetailTab {
  bossGroup,
  bossTeam,
  member,
}

extension FanGroupDetailTabBuilder on FanGroupDetailTab {
  String text(BuildContext context, {int totalMember = 0}) {
    switch (this) {
      case FanGroupDetailTab.bossTeam:
        return 'Boss Team ($totalMember)';
      case FanGroupDetailTab.member:
        return 'Thành viên Team ($totalMember)';
      case FanGroupDetailTab.bossGroup:
        return 'Boss Group ($totalMember)';
    }
  }

  Widget build(BuildContext context, FanGroup fanGroup) {
    switch (this) {
      case FanGroupDetailTab.bossGroup:
        return const BossGroupOfGroupFanPage();
      case FanGroupDetailTab.bossTeam:
        return const BossTeamsOfGroupFanPage();
      case FanGroupDetailTab.member:
        return const MemberOfGroupFanPage();
    }
  }
}
