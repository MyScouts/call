import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/following/screens/widgets/follower_infor_modal.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:flutter/material.dart';

import 'screens/following_screen.dart';
import 'screens/widgets/unconnection_modal.dart';

extension FollowingCoordinator on BuildContext {
  Future<T?> startFollowing<T>({
    required User user,
    required int friendCount,
    required int followerCount,
    required int followeeCount,
    required FollowingType followingType,
  }) {
    return Navigator.of(this).pushNamed(
      FollowingScreen.routeName,
      arguments: {
        "user": user,
        "friendCount": friendCount,
        "followerCount": followerCount,
        "followeeCount": followeeCount,
        "followingType": followingType,
      },
    );
  }

  Future<T?> followerInfor<T>({
    required String textSpan1,
    String? textSpanName,
    String? textSpan2,

  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return FollowerInforModal(
          textSpan1: textSpan1,
          textSpanName: textSpanName,
          textSpan2: textSpan2,
        );
      },
    );
  }

  Future<T?> unconnection<T>({
    required String name,
    required String avatar,
    required String connectionTitle,
    required String content,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierLabel: '',
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return UnconnectionModal(
          name: name,
          avatar: avatar,
          connectionTitle: connectionTitle,
          content: content,
        );
      },
    );
  }
}
