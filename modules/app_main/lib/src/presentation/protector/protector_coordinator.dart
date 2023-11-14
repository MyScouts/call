

import 'package:flutter/cupertino.dart';

import 'manage_protector_screen.dart';

extension ProtectorCoordinator on BuildContext {

  void startManageProtector() {
    Navigator.of(this).pushNamed(ManageProtectorScreen.routerName);
  }
}