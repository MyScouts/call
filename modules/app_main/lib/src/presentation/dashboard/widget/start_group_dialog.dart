import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/responses/open_group_request_response.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:app_main/src/presentation/community/groups/group_listing_bloc.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:wallet/core/core.dart';

class StartGroupDialog extends StatefulWidget {
  const StartGroupDialog({super.key});

  @override
  State<StartGroupDialog> createState() => _StartGroupDialogState();
}

class _StartGroupDialogState extends State<StartGroupDialog> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      insetPadding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: paddingHorizontal,
        ),
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildBody()],
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<GetOpenGroupRequestBloc, GetDetailState>(
      buildWhen: (previous, current) => current is GetDetailDataSuccess,
      builder: (context, state) {
        if (state is GetDetailDataSuccess<OpenGroupRequestResponse>) {
          final request = state.data.request;
          if (request == null) {
            context.read<GetMyGroupsBloc>().add(GetListDataEvent());
            return BlocBuilder<GetMyGroupsBloc, GetListState>(
              buildWhen: (pre, cur) => cur is GetListDataSuccess,
              builder: (context, state) {
                if (state is GetListDataSuccess<Group>) {
                  final myGroups = state.data;
                  if (myGroups.isNotEmpty) {
                    final groupId = myGroups.first.id;

                    Future.delayed(
                      const Duration(milliseconds: 200),
                      () {
                        Navigator.pop(context);
                        return context.startGroupDetail(id: groupId);
                      },
                    );
                  } else {
                    context.read<GetMyTeamsBloc>().add(GetListDataEvent());

                    return BlocBuilder<GetMyTeamsBloc, GetListState>(
                      buildWhen: (pre, cur) => cur is GetListDataSuccess,
                      builder: (context, state) {
                        if (state is GetListDataSuccess<Team>) {
                          final teams = state.data;
                          final myId =
                              injector.get<UserCubit>().currentUser?.id;
                          final isBoss = !teams
                              .every((element) => element.boss?.id != myId);
                          if (teams.isNotEmpty) {
                            if (isBoss) {
                              final teamId = teams
                                  .firstWhere(
                                      (element) => element.boss?.id == myId)
                                  .groupId;
                              context.startGroupDetail(id: teamId);
                            } else {
                              return _buildDialogContent(
                                title: 'Thông báo',
                                content: 'Bạn không phải Boss!',
                                actionTitle: 'Quay về',
                                actionButtonBackgroundColor:
                                    const Color(0xFF4B84F7),
                              );
                            }
                          } else {
                            return _buildDialogContent(
                              title: 'Thông báo',
                              content:
                                  'Bạn chưa đăng ký Boss Group. Vui lòng đăng ký để tiếp tục !',
                              actionTitle: 'Đăng ký',
                              onAction: () {
                                context.startRegisterBossGroup();
                              },
                              hasDisMissAction: true,
                              actionButtonBackgroundColor:
                                  const Color(0xFF4B84F7),
                            );
                          }
                        }
                        return Center(
                          child: isAndroid
                              ? const CircularProgressIndicator()
                              : const CupertinoActivityIndicator(),
                        );
                      },
                    );
                  }
                }
                return Center(
                  child: isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
                );
              },
            );
          } else {
            return _buildDialogContent(
              hasCloseIcon: true,
              title: 'Chờ phê duyệt',
              content:
                  'Yêu cầu đăng ký Boss Group thành công. Vui lòng chờ cho đến khi Admin phê duyệt!',
              actionTitle: 'Hủy yêu cầu',
              onAction: () {
                context.read<DeleteOpenGroupRequestBloc>().add(
                      GetDetailDataEvent(),
                    );
                showToastMessage('Huỷ yêu cầu Boss Group thành công');
              },
            );
          }
        }
        return Center(
          child: isAndroid
              ? const CircularProgressIndicator()
              : const CupertinoActivityIndicator(),
        );
      },
    );
  }

  _buildDialogContent({
    required String title,
    required String content,
    required String actionTitle,
    TextStyle? contentStyle,
    VoidCallback? onAction,
    bool? hasDisMissAction,
    bool? hasCloseIcon,
    Color? actionButtonBackgroundColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasCloseIcon == true)
              Opacity(
                opacity: 0,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.close),
                ),
              ),
            const Spacer(),
            Text(
              title,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 24 / 16,
              ),
            ),
            const Spacer(),
            if (hasCloseIcon == true)
              InkWell(
                onTap: context.popNavigator,
                child: const Icon(Icons.close),
              ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          content,
          style: contentStyle ??
              context.text.titleLarge?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF6E6E6E),
                height: 20 / 14,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            if (hasDisMissAction == true)
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    backgroundColor: const Color(0xFFF4F4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: context.popNavigator,
                  child: Text(
                    'Hủy',
                    style: context.text.bodyLarge?.copyWith(
                      color: const Color(0xFF6E6E6E),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 24 / 16,
                    ),
                  ),
                ),
              ),
            if (hasDisMissAction == true) const SizedBox(width: 10),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                  backgroundColor:
                      actionButtonBackgroundColor ?? const Color(0xFFDE372D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  context.popNavigator();
                  onAction?.call();
                },
                child: Text(
                  actionTitle,
                  style: context.text.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 24 / 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
