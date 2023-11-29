import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/social/profile/diary_screen.dart';
import 'package:app_main/src/presentation/social/profile/widgets/block_user_modal.dart';
import 'package:app_main/src/presentation/social/profile/widgets/diary_menu_actions.dart';
import 'package:app_main/src/presentation/social/profile/widgets/friend_actions.dart';
import 'package:app_main/src/presentation/social/profile/widgets/report_user_modal.dart';
import 'package:flutter/material.dart';

import '../../../blocs/user_action/user_action_cubit.dart';

extension AuthenticationCoordinator on BuildContext {
  Future<T?> startDiary<T>({
    String? userId,
  }) {
    return Navigator.of(this).pushNamed(
      DiaryScreen.routeName,
      arguments: {
        "userId": userId,
      },
    );
  }

  Future<T?> startReplaceDiary<T>({
    String? userId,
  }) {
    return Navigator.of(this).pushReplacementNamed(
      DiaryScreen.routeName,
      arguments: {
        "userId": userId,
      },
    );
  }

  Future<T?> showDiaryActions<T>({required User userInfo}) {
    return showModalBottomSheet(
      context: this,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DiaryMenuActions(userInfo: userInfo),
    );
  }

  Future<T?> showFriendActions<T>({required User userInfo}) {
    return showModalBottomSheet(
      context: this,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider(
        create: (context) => injector.get<UserActionCubit>(),
        child: BlocListener<UserActionCubit, UserActionState>(
          listener: (context, state) {
            if (state is OnUnFollow) {
              showLoading();
            }

            if (state is UnFollowSuccess) {
              hideLoading();
              Navigator.pop(context, userInfo.copyWith(isFollowed: false));
              if (userInfo.isFriend) {
                showToastMessage("Huỷ kết bạn thành công.");
              } else {
                showToastMessage("Bỏ theo dõi người dùng thành công.");
              }
            }

            if (state is UnFollowFail) {
              hideLoading();
              showToastMessage("Bỏ theo dõi người dùng thất bại.");
            }
          },
          child: FriendMenuActions(userInfo: userInfo),
        ),
      ),
    );
  }

  Future<T?> startReportUser<T>({required User userInfo}) {
    return showModalBottomSheet(
      context: this,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider(
        create: (context) => injector.get<UserActionCubit>(),
        child: BlocListener<UserActionCubit, UserActionState>(
          listener: (context, state) {
            if (state is OnReportUser) {
              showLoading();
            }

            if (state is ReportUserSuccess) {
              hideLoading();
              Navigator.pop(context);
              showToastMessage("Báo cáo người dùng thành công");
            }

            if (state is ReportUserFail) {
              hideLoading();
              showToastMessage(state.message, ToastMessageType.error);
            }
          },
          child: ReportUserModal(userInfo: userInfo),
        ),
      ),
    );
  }

  Future<T?> startBlockUser<T>({required User userInfo}) {
    return showModalBottomSheet(
      context: this,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider(
        create: (context) => injector.get<UserActionCubit>(),
        child: BlocListener<UserActionCubit, UserActionState>(
          listener: (context, state) {
            if (state is OnBlockUser) {
              showLoading();
            }

            if (state is BlockUserSuccess) {
              hideLoading();
              Navigator.pop(
                  context,
                  userInfo.copyWith(
                    isFollowed: false,
                    isFriend: false,
                    isFollowing: false,
                  ));
              showToastMessage("Chặn người dùng thành công.");
            }

            if (state is ReportUserFail) {
              hideLoading();
              showToastMessage(state.message, ToastMessageType.error);
            }
          },
          child: BlockUserModal(userInfo: userInfo),
        ),
      ),
    );
  }
}
