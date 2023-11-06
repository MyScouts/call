import 'package:flutter/material.dart';

import '../../ui.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BaseAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      centerTitle: true,
      leading: const CustomBackButton(alignment: Alignment.centerRight),
      shape: Border.all(width: 0, color: Colors.transparent),
      actions: const [
        CustomCloseButton(alignment: Alignment.centerLeft),
      ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
