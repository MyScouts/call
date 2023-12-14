//import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class MemberPage extends StatefulWidget {
  static const routeName = 'MemberPage';

  const MemberPage({super.key});

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
      appBar: BaseAppBar(
        title: 'Thành viên',
        actions: [TextButton(onPressed: () {}, child: const Text('Thêm'))],
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
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
        children: const [
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}
