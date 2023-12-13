import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:flutter/material.dart';

import 'core/coordinator/app_context.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (ctx) {
          AppContext.scaffoldContext = ctx;
          return child;
        },
      ),
    );
  }
}
