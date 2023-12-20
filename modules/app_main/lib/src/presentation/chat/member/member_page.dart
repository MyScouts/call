//import 'dart:developer' as developer;
import 'package:app_main/src/presentation/chat/chat_coordinator.dart';
import 'package:app_main/src/presentation/chat/member/tab/admin/admin_tab_widget.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/member_tab_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  static const routeName = 'MemberPage';
  final int type;
  final int conversationId;

  const MemberPage({super.key, required this.type, required this.conversationId});

  @override
  MemberPageState createState() => MemberPageState();
}

class MemberPageState extends State<MemberPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thành viên'),
        actions: [
          if (widget.type == 2 || widget.type == 3)
            TextButton(
              onPressed: () {
                context.toAddMemberPage(widget.conversationId);
              },
              child: Text(
                'Thêm',
                style: context.text.bodyLarge?.copyWith(color: AppColors.blueEdit, fontSize: 16),
              ),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.blueEdit,
          labelStyle: context.text.bodyMedium,
          unselectedLabelStyle: context.text.bodyMedium,
          unselectedLabelColor: AppColors.grey40,
          indicatorColor: AppColors.blueEdit,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2,color: AppColors.blueEdit),
          ),
          tabs: const [
            Tab(
              text: 'Tất cả',
            ),
            Tab(
              text: 'Quản trị viên',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MemberTabWidget(
            conversationId: widget.conversationId,
            type: widget.type,
          ),
          AdminTabWidget(
            conversationId: widget.conversationId,
            isAdmin: widget.type == 2,
          ),
        ],
      ),
    );
  }
}
