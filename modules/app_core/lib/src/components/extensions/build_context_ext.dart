import 'package:flutter/material.dart';

extension BuildContextExtRoute on BuildContext {
  String? get currentName => ModalRoute.of(this)?.settings.name;

  bool isRouteNamed(String routeNamed) {
    return routeNamed == currentName;
  }

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}
