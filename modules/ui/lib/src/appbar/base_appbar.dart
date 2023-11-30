import 'package:flutter/material.dart';

import '../../ui.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool isClose;
  final Function()? onPressed;
  final Color? backgroundColor;
  const BaseAppBar({
    super.key,
    this.isClose = true,
    this.title,
    this.onPressed, this.titleWidget, this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(title ?? ''),
      backgroundColor: backgroundColor ?? Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,
      centerTitle: true,
      leading: CustomBackButton(
        alignment: Alignment.center,
        onPressed: onPressed,
      ),
      shape: Border.all(width: 0, color: Colors.transparent),
      actions: [
        if (isClose) const CustomCloseButton(alignment: Alignment.center),
      ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
