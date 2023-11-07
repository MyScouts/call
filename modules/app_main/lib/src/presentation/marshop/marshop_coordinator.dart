import 'package:app_main/src/presentation/marshop/register_customer/register_customer_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
import 'package:flutter/material.dart';

extension UpgradeMarshopCoordinator on BuildContext {
  Future<T?> startRegisterCustomer<T>() {
    return Navigator.of(this).pushNamed(RegisterCustomerScreen.routeName);
  }

  Future<T?> startRegisterMarshop<T>() {
    return Navigator.of(this).pushNamed(RegisterMarshopScreen.routeName);
  }
}
