import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/group_detail/update_group_options_screen.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/ask_tojoin_team_success_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/team_request_list_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/update_team_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import 'community_constants.dart';
import 'edit_community_detail/edit_community_detail_screen.dart';
import 'edit_fan_group/edit_fan_group_screen.dart';
import 'fan_group_detail/fan_group_detail_screen.dart';
import 'group_detail/group_detail_screen.dart';
import 'group_detail/group_request_list_screen.dart';
import 'team_detail/pages/ask_to_join_team_screen.dart';
import 'team_detail/team_detail_screen.dart';

extension CommunityCoordinator on BuildContext {
  Future<T?> startGroupDetail<T>(
      {required String? id, String? groupName, String? cover}) {
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
      {required String? id, String? name, int? bossGroupId}) {
    // if (!isAuthenticated) {
    //   return startLogin<T>(hasDashboard: true);
    // }

    return Navigator.of(this).pushNamed(TeamDetailScreen.routeName, arguments: {
      'id': id,
      'name': name,
      'bossGroupId': bossGroupId,
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

  Future<T?> startUpdateGroupOptions<T>({required Community community}) {
    return Navigator.of(this).pushNamed(
      UpdateGroupOptionScreen.routeName,
      arguments: {'community': community},
    );
  }

  Future<T?> startGroupRequestList<T>() {
    return Navigator.of(this).pushNamed(GroupRequestListScreen.routeName);
  }

  Future<T?> startDialogRelinquishBoss<T>(String id, CommunityType communityType) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ConfirmDialog(
          title: 'Từ chức Boss ${communityType.text}?',
          actionTitle: 'Từ chức',
          content: communityType.relinquishContent,
          onAction: () {
            final bloc = injector.get<RelinquishBossRoleBloc>();
            bloc.add(GetDetailDataParam2Event(id, communityType));
          },
        );
      },
    );
  }

  Future<T?> startDialogBossStatus<T>(int dayLeft) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ApproveDialog(
          type: DialogApproveStatus.waiting,
          content:
              'Yêu cầu của bạn đã được gửi lên hệ thống của chúng tôi. Thời hạn của yêu cầu còn lại $dayLeft ngày.',
        );
      },
    );
  }

  Future<T?> startDialogApproveGroupRequest<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return const ApproveDialog(
          type: DialogApproveStatus.approved,
          content: 'Bạn đã phê duyệt yêu cầu từ chức của Boss Team',
        );
      },
    );
  }

  Future<T?> startAskToJoinTeam<T>(String teamId) {
    return Navigator.of(this).pushNamed(
      AskToJoinTeamScreen.routeName,
      arguments: teamId,
    );
  }

  Future<T?> startAskToJoinTeamSuccess<T>() {
    return Navigator.of(this).pushNamed(AskToJoinTeamSuccessScreen.routeName);
  }

  void backToTeamDetailScreen<T>() {
    return Navigator.of(this)
        .popUntil(ModalRoute.withName(TeamDetailScreen.routeName));
  }

  Future<T?> startTeamRequestsScreen<T>() {
    return Navigator.of(this).pushNamed(TeamRequestListScreen.routeName);
  }

  Future<T?> startUpdateTeamOptionsScreen<T>({required Team team}) {
    return Navigator.of(this).pushNamed(
      UpdateTeamOptionsScreen.routeName,
      arguments: team,
    );
  }

  Future<T?> startDialogConfirmLeaveTeam<T>({required VoidCallback onAction}) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ConfirmDialog(
          title: 'Bạn có muốn rời Team ?',
          actionTitle: 'Rời Team',
          content:
              'Chúng tôi sẽ tiếp nhận yêu cầu rời Team của bạn và sẽ gửi bạn thông báo mới nhất.',
          onAction: onAction.call,
        );
      },
    );
  }
}
