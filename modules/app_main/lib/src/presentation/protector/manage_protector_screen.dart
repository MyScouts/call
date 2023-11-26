import 'package:app_main/src/presentation/protector/widget/list_follow_request_tab.dart';
import 'package:app_main/src/presentation/protector/widget/list_protector_request_tab.dart';
import 'package:app_main/src/presentation/protector/widget/list_protector_tab.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class ManageProtectorScreen extends StatefulWidget {
  static const String routerName = '/manage-protector';

  const ManageProtectorScreen({super.key});

  @override
  State<ManageProtectorScreen> createState() => ManageProtectorScreenState();
}

class ManageProtectorScreenState extends State<ManageProtectorScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: const Text(
            'Quản lý người bảo hộ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
        ),
        body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          headerSliverBuilder: (_, __) => [
            const SliverAppBar(
              floating: true,
              pinned: true,
              title: SegmentPicker(
                tabs: ["Danh sách", "Phê duyệt", 'Theo dõi'],
                selectedTextColor: Color(0xff4B84F7),
              ),
              leadingWidth: 0,
              leading: SizedBox.shrink(),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              ListProtectorTab(),
              ListProtectorRequestTab(),
              ListFollowRequestTab(),
            ],
          ),
        ),
      ),
    );
  }
}
