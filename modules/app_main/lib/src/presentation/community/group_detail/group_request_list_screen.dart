import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/confirm_response.dart';
import 'package:app_main/src/data/models/responses/group_request_response.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/widgets/group_request_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

import '../../../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart';
import '../groups/group_listing_bloc.dart';

class GroupRequestListScreen extends StatefulWidget {
  static const String routeName = '/group-requests';

  const GroupRequestListScreen({super.key});

  @override
  State<GroupRequestListScreen> createState() => _GroupRequestListScreenState();
}

class _GroupRequestListScreenState extends State<GroupRequestListScreen> {
  bool isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Yêu cầu cần phê duyệt',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      backgroundColor: AppColors.white,
      body: BlocListener<ReplyGiveUpBossTeamBloc, GetDetailState>(
        listener: _onReplyGiveUpBossTeamBlocListener,
        child: BlocBuilder<GetGroupRequestsBloc, GetListState>(
          builder: (context, state) {
            if (state is GetListDataSuccess<GroupRequest>) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final request = state.data[index];
                  return GroupRequestWidget(
                    request: request,
                    onReplyRequest: (value) {
                      isApproved = value;
                      context.read<ReplyGiveUpBossTeamBloc>().add(
                            GetDetailDataParam2Event(
                              '${request.team?.id}',
                              ReplyGiveUpBossTeamRolePayload(
                                userId: request.user!.id!,
                                isApproved: value,
                              ),
                            ),
                          );
                    },
                    // },
                    // onReject: () {
                    //   context.showToastMessage(
                    //     'Bạn đã từ chối yêu cầu từ chức của Boss Team ${mockRequests[index].team?.name}',
                    //   );
                    // },
                  );
                  // return GroupRequestWidget(request: state.data[index]);
                },
                itemCount: state.data.length,
              );
            } else if (state is GetListDataError) {
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
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _onReplyGiveUpBossTeamBlocListener(
      BuildContext context, GetDetailState state) {
    if (state is GetDetailDataLoading) {
      showLoading();
    } else if (state is GetDetailDataSuccess<ConfirmResponse>) {
      hideLoading();
      if(isApproved){
        context.startDialogApproveGroupRequest();
      } else {
        showToastMessage('Bạn đã từ chối yêu  từ chức Boss Team', ToastMessageType.warning);
      }

      context.read<GetGroupRequestsBloc>().add(GetListDataEvent());
    } else if (state is GetDetailError) {
      hideLoading();
      final e = state.error;
      if (e is DioError) {
        final message = e.toMessage(context);
        showToastMessage(message, ToastMessageType.warning);
      } else {
        final message = 'Đã có lỗi xảy ra, vui lòng thử lại.'
            ' ${kDebugMode ? state.error.toString() : ''}';
        showToastMessage(message, ToastMessageType.error);
      }
    }
  }
}
