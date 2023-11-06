import 'package:flutter/material.dart';

class AutoHideKeyboard extends StatelessWidget {
  final Widget child;

  const AutoHideKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.hideKeyboard,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}

extension BuildCtxHideKeyboard on BuildContext {
  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

class ScaffoldHideKeyboard extends Scaffold {
  ScaffoldHideKeyboard({
    super.key,
    super.appBar,
    required Widget body,
    bool super.resizeToAvoidBottomInset = true,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.bottomNavigationBar,
    super.extendBody,
    super.backgroundColor,
    super.endDrawer,
  }) : super(
          body: AutoHideKeyboard(child: body),
        );
}
