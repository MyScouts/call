import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../ui.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final double? elevation;
  final bool isClose;
  final Function()? onPressed;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  const BaseAppBar({
    super.key,
    this.isClose = true,
    this.title,
    this.onPressed,
    this.titleWidget,
    this.backgroundColor,
    this.bottom,
    this.actions,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      title: titleWidget ?? Text(title ?? ''),
      backgroundColor: backgroundColor ?? Colors.transparent,
      bottomOpacity: 0.0,
      elevation: elevation ?? 0.0,
      centerTitle: true,
      leading: CustomBackButton(
        alignment: Alignment.center,
        onPressed: onPressed,
      ),
      shape: Border.all(width: 0, color: Colors.transparent),
      bottom: bottom,
      actions: actions ??
          [
            if (isClose) const CustomCloseButton(alignment: Alignment.center),
          ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
