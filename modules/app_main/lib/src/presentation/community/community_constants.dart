import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import 'groups/group_listing_bloc.dart';

class CommunityConstant {
  static const int dayForRelinquishBossGroupRequest = 40;
  static const int dayForLeaveTeamRequest = 90;
}

enum CommunityEventType {
  group,
  survey,
  charity,
  training,
}

extension CommunityEventTypeExt on CommunityEventType {
  String get icon {
    switch (this) {
      case CommunityEventType.group:
        return IconAppConstants.communityGroup;
      case CommunityEventType.survey:
        return IconAppConstants.communitySurvey;
      case CommunityEventType.charity:
        return IconAppConstants.communityCharity;
      case CommunityEventType.training:
        return IconAppConstants.communityTraining;
    }
  }

  String text(BuildContext context) {
    switch (this) {
      case CommunityEventType.group:
        return S.of(context).community_group;
      case CommunityEventType.survey:
        return S.of(context).community_survey;
      case CommunityEventType.charity:
        return S.of(context).community_charity;
      case CommunityEventType.training:
        return S.of(context).community_training;
    }
  }
}

enum CommunityType { group, team }

extension CommunityTypeExt on CommunityType {
  String label(BuildContext context) {
    switch (this) {
      case CommunityType.group:
        return 'Tên Group';
      case CommunityType.team:
        return 'Tên Team';
    }
  }

  String hintText(BuildContext context) {
    switch (this) {
      case CommunityType.group:
        return 'Nhập vào tên group';
      case CommunityType.team:
        return 'Nhập vào tên team';
    }
  }

  String errMsg(BuildContext context) {
    switch (this) {
      case CommunityType.group:
        return 'Tên group không được để trống';
      case CommunityType.team:
        return 'Tên team không được để trống';
    }
  }

  String hintIntroduction(BuildContext context) {
    switch (this) {
      case CommunityType.group:
        return 'Nhập vào Giới thiệu group';
      case CommunityType.team:
        return 'Nhập vào Giới thiệu team';
    }
  }
}

enum UpdateGroupOption { edit, pendingRequest, relinquish }

extension UpdateGroupOptionExt on UpdateGroupOption {
  String get title {
    switch (this) {
      case UpdateGroupOption.edit:
        return 'Chỉnh sửa thông tin Group';
      case UpdateGroupOption.pendingRequest:
        return 'Yêu cầu cần phê duyệt';
      case UpdateGroupOption.relinquish:
        return 'Từ chức Boss Group';
    }
  }

  Color get textColor {
    switch (this) {
      case UpdateGroupOption.edit:
        return const Color(0xFF212121);
      case UpdateGroupOption.pendingRequest:
        return const Color(0xFF212121);
      case UpdateGroupOption.relinquish:
        return AppColors.red3;
    }
  }

  Future<void> onTap(BuildContext context,
      {required Community community}) async {
    switch (this) {
      case UpdateGroupOption.edit:
        return context.showToastMessage(
          'Tính năng này đang được phát triển',
          ToastMessageType.warning,
        );
      // return await context.startEditInformation(
      //   community: community,
      //   type: CommunityType.group,
      // );
      case UpdateGroupOption.pendingRequest:
        return await context.startGroupRequestList();
      case UpdateGroupOption.relinquish:
        final getBossStatusBloc = context.read<GetBossStatusBloc>();
        return getBossStatusBloc
            .add(GetDetailDataParam1Event('${community.id}'));
    }
  }
}

enum ApproveGroupRequest { reject, approved }

extension ApproveGroupRequestExt on ApproveGroupRequest {
  bool get status {
    switch (this) {
      case ApproveGroupRequest.approved:
        return true;
      case ApproveGroupRequest.reject:
        return false;
    }
  }

  String get text {
    switch (this) {
      case ApproveGroupRequest.approved:
        return 'Phê duyệt';
      case ApproveGroupRequest.reject:
        return 'Từ chối';
    }
  }

  Color get textColor {
    switch (this) {
      case ApproveGroupRequest.approved:
        return AppColors.white;
      case ApproveGroupRequest.reject:
        return const Color(0xFF4B84F7);
    }
  }

  Color get buttonColor {
    switch (this) {
      case ApproveGroupRequest.approved:
        return const Color(0xFF4B84F7);

      case ApproveGroupRequest.reject:
        return const Color(0xFFE8F0FE);
    }
  }

  Widget get buttonIcon {
    switch (this) {
      case ApproveGroupRequest.approved:
        return ImageWidget(IconAppConstants.icApprovedTick,
            height: 25, width: 25);

      case ApproveGroupRequest.reject:
        return ImageWidget(IconAppConstants.icReject, height: 25, width: 25);
    }
  }
}

enum BossTeamActionToMember { assignBossTeam, remove }

extension BossTeamActionToMemberExt on BossTeamActionToMember {
  Color get textMenuColor {
    switch (this) {
      case BossTeamActionToMember.assignBossTeam:
        return const Color(0xFF101B28);
      case BossTeamActionToMember.remove:
        return AppColors.red3;
    }
  }

  String get textMenu {
    switch (this) {
      case BossTeamActionToMember.assignBossTeam:
        return 'Chỉ định Boss Team';
      case BossTeamActionToMember.remove:
        return 'Loại bỏ khỏi team';
    }
  }
}

enum UpdateTeamOption { edit, requests, invite, kick, relinquish }

extension UpdateTeamOptionExt on UpdateTeamOption {
  String get title {
    switch (this) {
      case UpdateTeamOption.edit:
        return 'Chỉnh sửa thông tin Team';
      case UpdateTeamOption.requests:
        return 'Yêu cầu cần phê duyệt';
      case UpdateTeamOption.relinquish:
        return 'Từ chức Boss Team';
      case UpdateTeamOption.invite:
        return 'Mời thêm thành viên';
      case UpdateTeamOption.kick:
        return 'Loại bỏ thành viên';
    }
  }

  Color get textColor {
    switch (this) {
      case UpdateTeamOption.edit:
      case UpdateTeamOption.requests:
      case UpdateTeamOption.invite:
      case UpdateTeamOption.kick:
        return const Color(0xFF212121);
      case UpdateTeamOption.relinquish:
        return AppColors.red3;
    }
  }

  Future<void> onTap(BuildContext context,
      {required Team team}) async {
    switch (this) {
      case UpdateTeamOption.relinquish:
      case UpdateTeamOption.invite:
      case UpdateTeamOption.kick:
      case UpdateTeamOption.edit:
        return context.showToastMessage(
          'Tính năng này đang được phát triển',
          ToastMessageType.warning,
        );
      case UpdateTeamOption.requests:
        return await context.startTeamRequestsScreen();
    }
  }
}
