import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as la;

extension ContextExtensions on BuildContext {
  Future<T?> pushNavigator<T>(Widget widget,
      {bool fullscreenDialog = false}) async {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(
        settings: RouteSettings(name: widget.runtimeType.toString()),
        fullscreenDialog: fullscreenDialog,
        builder: (context) => widget,
      ),
    );
  }

  Future<T?> pushNavigatorFromRightPosition<T>(
    Widget widget, {
    bool fullscreenDialog = false,
  }) async {
    return Navigator.push<T>(
      this,
      PageRouteBuilder(
        settings: RouteSettings(name: widget.runtimeType.toString()),
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        fullscreenDialog: fullscreenDialog,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
          ),
          child: child,
        ),
      ),
    );
  }

  void popNavigator<T extends Object?>([T? result]) =>
      Navigator.pop(this, result);

  void popUntilNavigator<T extends Object?>(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }

  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

extension DateTimeParseExt on DateTime {
  String toAppDateTimeFormat() =>
      la.DateFormat('HH:mm dd/MM/yyyy').format(toLocal());

  String toddMMHHmm() => la.DateFormat('dd/MM HH:mm').format(toLocal());
}
