import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:flutter/material.dart';

import 'group_request_list_screen.dart';

final items = [
  _Item('Chỉnh sửa thông tin Group', '', Colors.black),
  _Item(
      'Yêu cầu cần phê duyệt', GroupRequestListScreen.routeName, Colors.black),
  _Item('Từ chức Boss Group', '', Colors.red),
];

class _Item {
  final String text;
  final String router;
  final Color textColor;

  _Item(this.text, this.router, this.textColor);
}

class EditGroupDetail extends StatelessWidget {
  static const String routeName = '/date-group-options';
  const EditGroupDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          'Group luật sư',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: items
              .map<Widget>((e) => _ItemView(item: e))
              .toList()
              .separated(const Divider(height: 1, thickness: 1)),
        ),
      ),
    );
  }
}

class _ItemView extends StatelessWidget {
  const _ItemView({super.key, required this.item});

  final _Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(item.router);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50,
        alignment: Alignment.centerLeft,
        child: Text(
          item.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: item.textColor,
          ),
        ),
      ),
    );
  }
}
