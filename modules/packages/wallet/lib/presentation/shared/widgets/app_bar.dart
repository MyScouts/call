import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/wallet_theme.dart';


PreferredSizeWidget appbarBuilder(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
  bool hasBottom = false,
  Widget? leading,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    bottom: hasBottom
        ? PreferredSize(
            preferredSize: const Size.fromHeight(15),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: context.horizontal),
              color: WalletTheme.grey73,
              height: 2,
            ),
          )
        : null,
    bottomOpacity: 1,
    elevation: 0.0,
    shape: const Border(bottom: BorderSide(color: Colors.white)),
    title: Text(
      title,
      style: context.text.titleMedium
          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    leading: leading ??
        IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
    actions: actions,
  );
}
