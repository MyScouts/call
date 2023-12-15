//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/cubit/member_tab_cubit.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/cubit/member_tab_state.dart';
import 'package:app_main/src/presentation/chat/member/widgets/member_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class MemberTabWidget extends StatefulWidget {
  final bool isAdmin;
  final int conversationId;

  const MemberTabWidget({super.key, required this.isAdmin, required this.conversationId});

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
                                onTap: () {},
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
