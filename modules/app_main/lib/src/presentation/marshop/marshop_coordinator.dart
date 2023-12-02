import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/marshop/register_customer/register_customer_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/%20marshop_referral_code_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_pack_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_pack_detail_screen.dart';
import 'package:flutter/material.dart';

extension UpgradeMarshopCoordinator on BuildContext {
  Future<T?> startRegisterCustomer<T>({String? marshopId}) {
    return Navigator.of(this)
        .pushNamed(RegisterCustomerScreen.routeName, arguments: {
      "marshopId": marshopId,
    });
  }

  Future<T?> startReplaceRegisterCustomer<T>({String? marshopId}) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            RegisterCustomerScreen(marshopId: marshopId),
      ),
      ModalRoute.withName(DashBoardScreen.routeName),
    );
  }

  Future<T?> startRegisterMarshop<T>({String? marshopId}) {
    return Navigator.of(this)
        .pushNamed(RegisterMarshopScreen.routeName, arguments: {
      "marshopId": marshopId,
    });
  }

  Future<T?> startReplaceRegisterMarshop<T>({String? marshopId}) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) =>
            RegisterMarshopScreen(marshopId: marshopId),
      ),
      ModalRoute.withName(DashBoardScreen.routeName),
    );
  }

  Future<T?> startMarshopReferralScreen<T>() {
    return Navigator.of(this).pushNamed(MarshopReferralCodeScreen.routeName);
  }

  Future<T?> tartRegisterPackScreen<T>() {
    return Navigator.of(this).pushNamed(RegisterMarshopPackScreen.routeName);
  }

  Future<T?> tartRegisterPackDetailScreen<T>({
    required MarshopRegisterPackResponse pack,
  }) {
    return Navigator.of(this)
        .pushNamed(RegisterPackDetailScreen.routeName, arguments: {
      'pack': pack,
    });
  }
}
