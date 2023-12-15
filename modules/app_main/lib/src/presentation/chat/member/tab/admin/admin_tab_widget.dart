
//import 'dart:developer' as developer;
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/chat/member/tab/admin/cubit/admin_tab_cubit.dart';
import 'package:app_main/src/presentation/chat/member/tab/admin/cubit/admin_tab_state.dart';
import 'package:app_main/src/presentation/chat/member/widgets/member_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class AdminTabWidget extends StatefulWidget {
  final int conversationId;

  const AdminTabWidget({super.key, required this.conversationId});

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