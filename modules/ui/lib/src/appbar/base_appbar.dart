import 'package:flutter/material.dart';

import '../../ui.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isClose;
  final Function()? onPressed;
  const BaseAppBar({
    super.key,
    this.isClose = true,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      centerTitle: true,
      leading: CustomBackButton(
        alignment: Alignment.centerRight,
        onPressed: onPressed,
      ),
      shape: Border.all(width: 0, color: Colors.transparent),
      actions: [
        if (isClose) const CustomCloseButton(alignment: Alignment.centerLeft),
      ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
