import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../../../data/models/responses/boss_community_status_response.dart';
import '../../../data/models/responses/confirm_response.dart';
import '../community_constants.dart';
import '../groups/group_listing_bloc.dart';

class UpdateGroupOptionScreen extends StatelessWidget {
  final Community community;
  static const String routeName = '/update-group-options';

  const UpdateGroupOptionScreen({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '${community.name}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocListener<GetBossStatusBloc, GetDetailState>(
        listener: _onGetBossStatusBloc,
        child: BlocConsumer<RelinquishBossRoleBloc, GetDetailState>(
          listener: _onRelinquishBossGroup,
          builder: (context, state) => Column(
            children: UpdateGroupOption.values
                .map(
                  (option) => Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.borderColor),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ListTile(
                      title: Text(
                        option.title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: option.textColor,
                                ),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                      onTap: () => option.onTap(context, community: community),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void _onGetBossStatusBloc(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataLoading) {
      context.showLoading();
    } else if (state is GetDetailDataSuccess<BossCommunityStatusResponse>) {
      context.hideLoading();
      if (state.data.giveUpBossRoleRequest == null) {
        context.startDialogRelinquishBoss(
          '${community.id}',
          CommunityType.group,
        );
      } else {
        final dayLeft = state.data.giveUpBossRoleRequest!.createdAt!
            .add(const Duration(
                days: CommunityConstant.dayForRelinquishBossGroupRequest + 1))
            .dayLeft();

        context.startDialogBossStatus(dayLeft);
      }
    } else if (state is GetDetailError) {
      context.hideLoading();
      final e = state.error;
      if (e is DioError) {
        final message = e.toMessage(context);
        context.showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Đã có lỗi xảy ra, vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        context.showToastMessage(message, ToastMessageType.error);
      }
    }
  }

  void _onRelinquishBossGroup(BuildContext context, GetDetailState state) {
    if (state is GetDetailDataSuccess<ConfirmResponse>) {
      context.startDialogBossStatus(
          CommunityConstant.dayForRelinquishBossGroupRequest);
    } else if (state is GetDetailError) {
      final e = state.error;
      if (e is DioError) {
        final message = e.toMessage(context);
        context.showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Đã có lỗi xảy ra, vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        context.showToastMessage(message, ToastMessageType.error);
      }
    }
  }
}
