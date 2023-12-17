
//import 'dart:developer' as developer;
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/chat/member/tab/admin/cubit/admin_tab_cubit.dart';
import 'package:app_main/src/presentation/chat/member/tab/admin/cubit/admin_tab_state.dart';
import 'package:app_main/src/presentation/chat/member/widgets/member_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class AdminTabWidget extends StatefulWidget {
  final int conversationId;
  final bool isAdmin;

  const AdminTabWidget({super.key, required this.conversationId, required this.isAdmin});

  @override
  AdminTabWidgetState createState() => AdminTabWidgetState();
}

class AdminTabWidgetState extends State<AdminTabWidget> {

  final AdminTabCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.getAdmin(widget.conversationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: BlocBuilder<AdminTabCubit, AdminTabState>(
        bloc: _cubit,
        builder: (_, state) {
          return state.when(
                  (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.members.length} quản trị viên',
                    style: context.text.bodyMedium?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kSpacingHeight16,
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (_, index) {
                          return MemberWidget(
                            data: data.members[index],
                            action: widget.isAdmin &&
                                data.members[index].member.id !=
                                    getIt
                                        .get<UserSharePreferencesUsecase>()
                                        .getUserInfo()
                                        ?.id
                                ? Theme(
                              data: Theme.of(context).copyWith(
                                cardColor: AppColors.white,
                              ),
                              child: PopupMenuButton(
                                color: AppColors.white,
                                surfaceTintColor: AppColors.white,
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: AppColors.black,
                                ),
                                position: PopupMenuPosition.under,
                                onSelected: (i) {
                                  int memberId = data.members[index].member.id;
                                  switch (i) {
                                    case 0:
                                      _cubit.setAdmin(widget.conversationId, memberId).then((value) {
                                        Navigator.pop(context);
                                      });
                                      break;
                                    case 1:
                                      _cubit.revokeSecondAdmin(
                                          widget.conversationId, memberId);
                                      break;
                                    case 2:
                                      _cubit.kick(widget.conversationId, memberId);
                                      break;
                                    case 3:
                                      _cubit.kickMute(widget.conversationId, memberId);
                                      break;
                                  }
                                },
                                itemBuilder: (_) {
                                  return [
                                    PopupMenuItem<int>(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          ImageWidget(
                                            IconAppConstants.icSetAdmin,
                                            width: 24,
                                            height: 24,
                                          ),
                                          kSpacingWidth4,
                                          Text(
                                            'Nhượng quyền chủ phòng',
                                            style: context.text.bodyMedium?.copyWith(
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Row(
                                        children: [
                                          ImageWidget(
                                            IconAppConstants.icRemoveSecondAdmin,
                                            width: 24,
                                            height: 24,
                                          ),
                                          kSpacingWidth4,
                                          Text(
                                            'Xoá quyền phó phòng',
                                            style: context.text.bodyMedium?.copyWith(
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Row(
                                        children: [
                                          ImageWidget(
                                            IconAppConstants.icSetAdmin,
                                            width: 24,
                                            height: 24,
                                          ),
                                          kSpacingWidth4,
                                          Text(
                                            'Loại khỏi nhóm',
                                            style: context.text.bodyMedium?.copyWith(
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Row(
                                        children: [
                                          ImageWidget(
                                            IconAppConstants.icSetAdmin,
                                            width: 24,
                                            height: 24,
                                          ),
                                          kSpacingWidth4,
                                          Text(
                                            'Loại khỏi nhóm trong im lặng',
                                            style: context.text.bodyMedium?.copyWith(
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ];
                                },
                              ),
                            )
                                : null,
                          );
                        },
                        separatorBuilder: (_, __) => kSpacingHeight12,
                        itemCount: data.members.length),
                  )
                ],
              ),
              loading: () => const LoadingWidget(),
              error: (error) => const SizedBox.shrink());
        },
      ),
    );
  }
}