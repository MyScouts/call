import 'package:app_main/src/presentation/marshop/upgrade_marshop/register_customer_screen.dart';
import 'package:flutter/material.dart';

extension UpgradeMarshopCoordinator on BuildContext {
  Future<T?> startUpgradeMarshop<T>() {
    return Navigator.of(this).pushNamed(RegisterCustomerScreen.routeName);
  }
}
