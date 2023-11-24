import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:app_main/src/presentation/community/notification/community_notification_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/bloc/team_detail_bloc.dart';
import 'package:app_main/src/presentation/community/group_detail/update_group_options_screen.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/add_team_member_sheet.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/ask_tojoin_team_success_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/assign_boss_team_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/boss_group_menu.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/team_request_list_screen.dart';
import 'package:app_main/src/presentation/community/team_detail/pages/update_team_options_screen.dart';
import 'package:app_main/src/presentation/community/widgets/ask_asign_boss_modal.dart';
import 'package:app_main/src/presentation/community/widgets/assign_boss_modal.dart';
import 'package:app_main/src/presentation/community/widgets/request_waitting_modal.dart';
import 'package:app_main/src/presentation/community/widgets/revoke_boss_modal.dart';
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

  Future<T?> startTeamDetailFromQR<T>(
      {required String? id, String? name, int? bossGroupId}) {
    return Navigator.of(this)
        .pushReplacementNamed(TeamDetailScreen.routeName, arguments: {
      'id': id,
      'name': name,
      'bossGroupId': bossGroupId,
    });
  }

  Future<T?> startEditInformation<T>({
    required Community community,
    required CommunityType type,
  }) {
    return Navigator.of(this)
        .pushNamed(EditCommunityDetailScreen.routeName, arguments: {
      'community': community,
      'type': type,
    });
  }

  Future<T?> startFanGroupDetail<T>(FanGroup fanGroup) {
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

  Future<T?> startDialogRelinquishBoss<T>(
      String id, CommunityType communityType) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ConfirmDialog(
          title: 'Từ chức Boss ${communityType.text}',
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
          isWaitingDialog: true,
          dayLeft: dayLeft,
          content:
              'Yêu cầu của bạn đã được gửi lên hệ thống của chúng tôi. Thời hạn của yêu cầu còn lại',
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
          content: 'Bạn đã phê duyệt yêu cầu từ chức của Boss Team',
        );
      },
    );
  }

  Future<T?> shareLinkTeam<T>({Widget? qr, String? link}) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: false,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return ShareLinkDialog(
          link: link,
          qrCode: qr,
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

  Future<T?> startTeamRequestsScreen<T>({required Team team}) {
    return Navigator.of(this)
        .pushNamed(TeamRequestListScreen.routeName, arguments: {
      "team": team,
    });
  }

  Future<T?> startUpdateTeamOptionsScreen<T>({required Team team}) {
    return Navigator.of(this).push(MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<RelinquishBossRoleBloc>(
            create: (context) => injector.get(),
          ),
          BlocProvider<GetBossTeamRelinquishStatusBloc>(
            create: (context) => injector.get(),
          ),
          BlocProvider<TeamDetailBloc>.value(
            value: read<TeamDetailBloc>(),
          ),
        ],
        child: UpdateTeamOptionsScreen(team: team),
      ),
    ));
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

  Future<T?> startBossGroupMenu<T>({
    required Team team,
    required Function onRevokeBoss,
  }) {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BossGroupMenu(team: team),
    );
  }

  Future startAddMember() {
    return showModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => BlocProvider<TeamDetailBloc>.value(
        value: read(),
        child: const AddTeamMemberSheet(),
      ),
    );
  }

  Future<T?> startAssignTeam<T>(Team team) {
    return Navigator.of(this).pushNamed(
      AssignBossTeamScreen.routeName,
      arguments: {'team': team},
    );
  }

  Future<T?> startDialogConfirmAssignBoss<T>({
    required VoidCallback onAction,
    required User member,
    required Team team,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return AssignBossModal(member: member, onAction: onAction, team: team);
      },
    );
  }

  Future<T?> startDialogWarningAssignBossTeam<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return const WarningDialog(
          hasBackButton: true,
          title: 'Đã có Boss Team',
          content:
              'Vui lòng huỷ quyền Boss Team hiện tại để chỉ định Boss Team mới.',
        );
      },
    );
  }

  Future<T?> startRemoveBossModal<T>({
    required User member,
    required Team team,
  }) {
    TeamDetailBloc _bloc = injector.get<TeamDetailBloc>();
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return BlocProvider<TeamDetailBloc>(
          create: (context) => _bloc,
          child: BlocListener<TeamDetailBloc, TeamDetailState>(
            listener: (context, state) {
              if (state is OnRevokeBoss) {
                showLoading();
              }

              if (state is RevokeBossSuccess) {
                hideLoading();
                showToastMessage("Huỷ quyền Boss Team thành công.");
                Navigator.pop(context, true);
                Future.delayed(const Duration(milliseconds: 200));
              }
            },
            child: RevokeBossModal(
                member: member,
                onAction: () {
                  _bloc.add(RevokeBossEvent(teamId: team.id!));
                },
                team: team),
          ),
        );
      },
    );
  }

  Future<T?> startWaitingModal<T>() {
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return RequestWaitingModal();
      },
    );
  }

  Future<T?> confirmAssignBossTeam<T>({
    required VoidCallback onAction,
    required User member,
    required Team team,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        final _bloc = injector.get<TeamDetailBloc>();
        return BlocProvider(
          create: (context) => _bloc,
          child: BlocListener<TeamDetailBloc, TeamDetailState>(
            listener: (context, state) {
              if (state is OnAssignBoss) {
                showLoading();
              }
              if (state is AssignBossSuccess) {
                hideLoading();
                showToastMessage("Chỉ định boss team thành công");
                Navigator.pop(context, true);
              }

              if (state is AssignBossFail) {
                hideLoading();
                showToastMessage(state.message, ToastMessageType.error);
              }
            },
            child: AssignBossModal(
              member: member,
              onAction: () {
                _bloc.add(AssignBossEvent(
                  payload: AssignBossPayload(userId: member.id!),
                  teamId: team.id!,
                ));
              },
              team: team,
            ),
          ),
        );
      },
    );
  }

  Future<T?> askAssignBoss<T>({
    required Team team,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return AskAssignBossModal(team: team);
      },
    );
  }

  Future<T?> startCommunityNotification<T>() {
    return Navigator.of(this).pushNamed(CommunityNotificationScreen.routeName);
  }
}
