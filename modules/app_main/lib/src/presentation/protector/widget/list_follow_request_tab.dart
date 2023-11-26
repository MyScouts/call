import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ListFollowRequestTab extends StatefulWidget {
  const ListFollowRequestTab({super.key});

  @override
  State<ListFollowRequestTab> createState() => _ListFollowRequestTabState();
}

class _ListFollowRequestTabState extends State<ListFollowRequestTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Danh sách yêu cầu theo dõi"),
        ],
      ),
    );
  }
}
