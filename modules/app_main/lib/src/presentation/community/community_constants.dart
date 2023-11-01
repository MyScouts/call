import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

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
