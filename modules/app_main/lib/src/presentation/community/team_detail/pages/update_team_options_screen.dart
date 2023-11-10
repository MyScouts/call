import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/boss_team_relinquish_status_response.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../../community_constants.dart';

class UpdateTeamOptionsScreen extends StatelessWidget {
  final Team team;
  static const String routeName = '/update-team-options';

  const UpdateTeamOptionsScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    List<UpdateTeamOption> menus = List.from(UpdateTeamOption.values);
    menus.removeWhere(
      (element) =>
          team.boss?.id != team.group?.boss?.id &&
          [UpdateTeamOption.revokeBoss, UpdateTeamOption.assignBoss]
              .contains(element),
    );
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            '${team.name}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: BlocListener<GetBossTeamRelinquishStatusBloc, GetDetailState>(
          listener: _onGetBossTeamRelinquishStatusBlocListen,
          child: Column(
            children: menus
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
                      onTap: () => option.onTap(context, team: team),
                    ),
                  ),
                )
                .toList(),
          ),
        ));
  }

  void _onGetBossTeamRelinquishStatusBlocListen(
      BuildContext context, GetDetailState state) {
    if (state is GetDetailDataLoading) {
      context.showLoading();
    } else if (state
        is GetDetailDataSuccess<BossTeamRelinquishStatusResponse>) {
      context.hideLoading();

      if (state.data.giveUpRequest == null ||
          state.data.giveUpRequest!.isEmpty) {
        context.startDialogRelinquishBoss(
          '${team.id}',
          CommunityType.team,
        );
      } else {
        final dayLeft = state.data.giveUpRequest!.first.createdAt!
            .add(const Duration(
                days: CommunityConstant.dayForRelinquishBossTeamRequest + 1))
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
}
