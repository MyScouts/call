import 'package:flutter/material.dart';

import 'core/coordinator/app_context.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (ctx) {
          AppContext.scaffoldContext = ctx;
          return child;
        },
      ),
    );
  }
}
