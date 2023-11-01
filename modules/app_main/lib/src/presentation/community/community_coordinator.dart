import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

import '../authentication/authentication_coordinator.dart';
import 'community_constants.dart';
import 'edit_community_detail/edit_community_detail_screen.dart';
import 'edit_fan_group/edit_fan_group_screen.dart';
import 'fan_group_detail/fan_group_detail_screen.dart';
import 'group_detail/group_detail_screen.dart';
import 'team_detail/team_detail_screen.dart';

extension CommunityCoordinator on BuildContext {
  Future<T?> startGroupDetail<T>(
      {required int? id, String? groupName, String? cover}) {
    // if (!isAuthenticated) {
    //   return startLogin<T>(hasDashboard: true);
    // }

    return Navigator.of(this)
        .pushNamed(GroupDetailScreen.routeName, arguments: {
      'id': id,
      'groupName': groupName,
      'cover': cover,
    });
  }

  Future<T?> startTeamDetail<T>(
      {required int? id, String? name, String? cover}) {
    // if (!isAuthenticated) {
    //   return startLogin<T>(hasDashboard: true);
    // }

    return Navigator.of(this).pushNamed(TeamDetailScreen.routeName, arguments: {
      'id': id,
      'name': name,
      'cover': cover,
    });
  }

  Future<T?> startEditInformation<T>({
    required Community community,
    required CommunityType type,
  }) {
    // if (!isAuthenticated) {
    //   return startLogin<T>(hasDashboard: true);
    // }

    return Navigator.of(this)
        .pushNamed(EditCommunityDetailScreen.routeName, arguments: {
      'community': community,
      'type': type,
    });
  }

  Future<T?> startFanGroupDetail<T>(FanGroup fanGroup) {
    // if (!isAuthenticated) {
    //   return startLogin<T>(hasDashboard: true);
    // }

    return Navigator.of(this)
        .pushNamed(FanGroupDetailScreen.routeName, arguments: {
      'fanGroup': fanGroup,
    });
  }

  Future<T?> startEditFanGroup<T>(FanGroup fanGroup) {
    return Navigator.of(this)
        .pushNamed(EditFanGroupScreen.routeName, arguments: {
      'fanGroup': fanGroup,
    });
  }
}
