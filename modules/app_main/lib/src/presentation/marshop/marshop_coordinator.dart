import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/marshop/register_customer/register_customer_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/%20marshop_referral_code_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_infomation_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_information_address_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_pack_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_pack_detail_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/transaction_detail_screen.dart';
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

  Future<T?> tartRegisterPackScreen<T>({
    required User authInfo,
    required MarshopResponse marshop,
  }) {
    return Navigator.of(this)
        .pushNamed(RegisterMarshopPackScreen.routeName, arguments: {
      'authInfo': authInfo,
      'marshop': marshop,
    });
  }

  Future<T?> tartRegisterPackDetailScreen<T>(
      {required MarshopRegisterPackResponse pack}) {
    return Navigator.of(this).pushNamed(RegisterPackDetailScreen.routeName,
        arguments: {'pack': pack});
  }

  Future<T?> startConfirmInfomationScreen<T>({
    required MarshopRegisterPackResponse pack,
    required User authInfo,
    required MarshopResponse marshop,
  }) {
    return Navigator.of(this)
        .pushNamed(ConfirmInfomationScreen.routeName, arguments: {
      'pack': pack,
      'authInfo': authInfo,
      'marshop': marshop,
    });
  }

  Future<T?> startConfirmInfomationAddressScreen<T>({
    required MarshopRegisterPackResponse pack,
    required User authInfo,
    required MarshopResponse marshop,
  }) {
    return Navigator.of(this)
        .pushNamed(ConfirmInfomationAddressScreen.routeName, arguments: {
      'pack': pack,
      'authInfo': authInfo,
      'marshop': marshop,
    });
  }

  Future<T?> startTransactionDetail<T>({
    required MarshopRegisterPackResponse pack,
    required User authInfo,
    required MarshopResponse marshop,
    required UpdatePlaceInformationPayload address,
  }) {
    return Navigator.of(this)
        .pushNamed(TransactionDetailScreen.routeName, arguments: {
      'pack': pack,
      'authInfo': authInfo,
      'marshop': marshop,
      'address': address,
    });
  }
}
