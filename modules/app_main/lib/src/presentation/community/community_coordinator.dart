import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/group_detail/update_community_options_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import 'community_constants.dart';
import 'edit_community_detail/edit_community_detail_screen.dart';
import 'edit_fan_group/edit_fan_group_screen.dart';
import 'fan_group_detail/fan_group_detail_screen.dart';
import 'group_detail/group_detail_screen.dart';
import 'group_detail/group_request_list_screen.dart';
import 'groups/group_listing_bloc.dart';
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
      {required String? id, String? name, String? cover}) {
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

  Future<T?> startUpdateGroupOptions<T>({required Community community}) {
    return Navigator.of(this).pushNamed(
      UpdateCommunityOptionScreen.routeName,
      arguments: {'community': community},
    );
  }

  Future<T?> startGroupRequestList<T>() {
    return Navigator.of(this).pushNamed(GroupRequestListScreen.routeName);
  }

  Future<T?> startDialogRelinquishBoss<T>(String id) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ConfirmDialog(
          title: 'Từ chức Boss group?',
          actionTitle: 'Từ chức',
          content:
              'Khi từ chức Boss Group bạn vẫn sẽ là Boss Team của Team hiện tại nhưng bạn sẽ mất các đặc quyền của Boss Group.',
          onAction: () {
            final bloc = injector.get<RelinquishBossGroupBloc>();
            bloc.add(GetDetailDataParam1Event(id));
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
              'Yêu cầu của bạn đã được gửi lên hệ thống của chúng tôi. Thời hạn của yêu cầu là $dayLeft ngày.',
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
          content:
              'Bạn đã phê duyệt yêu cầu từ chức của Boss Team',
        );
      },
    );
  }
}
