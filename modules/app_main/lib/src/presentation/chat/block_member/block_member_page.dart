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

class BlockMemberPage extends StatefulWidget {
  static const routeName = 'BlockMemberPage';
  final int conversationId;
  const BlockMemberPage({super.key, required this.conversationId});

  @override
  BlockMemberPageState createState() => BlockMemberPageState();
}

class BlockMemberPageState extends State<BlockMemberPage> {
  final MemberTabCubit _cubit = getIt.get();

  @override
  void initState() {
    _cubit.getMember(widget.conversationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Chặn thành viên',
        isClose: false,
      ),
      body: BlocBuilder<MemberTabCubit, MemberTabState>(
        bloc: _cubit,
        builder: (_, state) {
          return state.when(
              (data) => ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  itemBuilder: (_, index) {
                    return MemberWidget(
                      data: data.membersNotMe[index],
                      showAction: false,
                      onTapWidget: () {
                        showDialog(
                          context: context,
                          builder: (_) => ChatDialog(
                            title: 'Chặn ${data.membersNotMe[index].member.displayName}',
                            content:
                                '${data.membersNotMe[index].member.displayName} sẽ không thể :\n\n'
                                ' • Xem bài viết trên trang cá nhân của bạn\n'
                                ' • Nhắn tin cho bạn\n'
                                ' • Thêm bạn làm bạn bè\n'
                                ' • Nếu các bạn là bạn bè, chặn tài khoản đồng nghĩa với việc hủy kết bạn',
                            actionTitle: 'Xác nhận',
                            actionColor: AppColors.blueEdit,
                            contentAlign: TextAlign.start,
                            onAction: () {
                              _cubit.blockUser(data.membersNotMe[index].member.id).then(
                                    (value) => Navigator.pop(context),
                                  );
                            },
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => kSpacingHeight12,
                  itemCount: data.membersNotMe.length),
              loading: () => const LoadingWidget(),
              error: (error) => const SizedBox.shrink());
        },
      ),
    );
  }
}
