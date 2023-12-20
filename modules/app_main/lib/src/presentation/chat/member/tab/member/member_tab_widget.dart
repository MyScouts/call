//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/cubit/member_tab_cubit.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/cubit/member_tab_state.dart';
import 'package:app_main/src/presentation/chat/member/widgets/member_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class MemberTabWidget extends StatefulWidget {
  final int type;
  final int conversationId;

  const MemberTabWidget({super.key, required this.type, required this.conversationId});

  @override
  MemberTabWidgetState createState() => MemberTabWidgetState();
}

class MemberTabWidgetState extends State<MemberTabWidget> {
  final MemberTabCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.getMember(widget.conversationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: BlocBuilder<MemberTabCubit, MemberTabState>(
        bloc: _cubit,
        builder: (_, state) {
          return state.when(
              (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.members.length} thành viên',
                        style: context.text.bodyMedium?.copyWith(
                          color: AppColors.grey40,
                        ),
                      ),
                      kSpacingHeight16,
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (_, index) {
                              return MemberWidget(
                                data: data.members[index],
                                action: widget.type == 2 || widget.type == 3 &&
                                        data.members[index].member.id !=
                                            getIt
                                                .get<UserSharePreferencesUsecase>()
                                                .getUserInfo()
                                                ?.id &&
                                        data.members[index].type != 2
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
                                                _cubit
                                                    .setAdmin(widget.conversationId, memberId)
                                                    .then((value) {
                                                  Navigator.pop(context);
                                                });
                                                break;
                                              case 1:
                                                _cubit.setSecondAdmin(
                                                    widget.conversationId, memberId);
                                                break;
                                              case 2:
                                                _cubit.revokeSecondAdmin(
                                                    widget.conversationId, memberId);
                                                break;
                                              case 3:
                                                _cubit.kick(widget.conversationId, memberId);
                                                break;
                                              case 4:
                                                _cubit.kickMute(widget.conversationId, memberId);
                                                break;
                                            }
                                          },
                                          itemBuilder: (_) {
                                            return [
                                              if(widget.type == 2)
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
                                              if (data.members[index].type == 1)
                                                PopupMenuItem<int>(
                                                  value: 1,
                                                  child: Row(
                                                    children: [
                                                      ImageWidget(
                                                        IconAppConstants.icSetSecondAdmin,
                                                        width: 24,
                                                        height: 24,
                                                      ),
                                                      kSpacingWidth4,
                                                      Text(
                                                        'Chọn làm phó phòng',
                                                        style: context.text.bodyMedium?.copyWith(
                                                          color: AppColors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              else if (data.members[index].type == 3)
                                                PopupMenuItem<int>(
                                                  value: 2,
                                                  child: Row(
                                                    children: [
                                                      ImageWidget(
                                                        IconAppConstants.icSetSecondAdmin,
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
                                                      'Loại khỏi nhóm',
                                                      style: context.text.bodyMedium?.copyWith(
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem<int>(
                                                value: 4,
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
