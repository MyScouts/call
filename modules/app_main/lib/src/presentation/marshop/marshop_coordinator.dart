import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/marshop/marshop_payload.dart';
import 'package:app_main/src/data/models/responses/marshop_response.dart';
import 'package:app_main/src/domain/entities/update_account/update_place_information_payload.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/dashboard_screen.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/marshop/register_customer/register_customer_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/%20marshop_referral_code_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_infomation_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_information_address_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/contract_confirm_dialog.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_otp_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_pack_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_pack_detail_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/transaction_detail_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'register_marshop/register_pack_action_dialog.dart';

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
    required int totalPrice,
    required List<RegisterPackProductInfo> productResult,
  }) {
    return Navigator.of(this)
        .pushNamed(ConfirmInfomationAddressScreen.routeName, arguments: {
      'pack': pack,
      'authInfo': authInfo,
      'marshop': marshop,
      'totalPrice': totalPrice,
      'productResult': productResult,
    });
  }

  Future<T?> startTransactionDetail<T>({
    required MarshopRegisterPackResponse pack,
    required User authInfo,
    required MarshopResponse marshop,
    required UpdatePlaceInformationPayload address,
    required int totalPrice,
    required List<RegisterPackProductInfo> productResult,
  }) {
    return Navigator.of(this)
        .pushNamed(TransactionDetailScreen.routeName, arguments: {
      'pack': pack,
      'authInfo': authInfo,
      'marshop': marshop,
      'address': address,
      'totalPrice': totalPrice,
      'productResult': productResult,
    });
  }

  Future<T?> startWaitingDialog<T>() {
    return showGeneralDialog<T>(
        context: this,
        barrierDismissible: false,
        barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {
          return NotificationDialog(
            onPressed: () => context.startDashboardUtil(),
            title: "Chờ xác nhận",
            btnText: "Xác nhận",
            image: Assets.images_bg_waiting.path,
            summary:
                "Bạn sẽ nhận được thông báo ngay khi yêu cầu được xác nhận",
          );
        });
  }

  Future<T?> startConfirmActionPackDialog<T>(
      {required Function(RegisterPackAction?) onChange}) {
    RegisterPackAction? action = RegisterPackAction.buy;
    return showGeneralDialog<T>(
        context: this,
        barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {
          return ActionDialog(
            title: "Xác nhận",
            actionTitle: "Đồng ý",
            widget: RegisterPackActionDialog(
              onChange: (val) {
                action = val;
              },
            ),
            onAction: () => onChange(action),
          );
        });
  }

  Future<T?> startContractConfirm<T>({
    required RegisterPackAction action,
    required Function onConfirm,
  }) {
    return showGeneralDialog<T>(
        context: this,
        barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {
          return DialogContainerWidget(
            child: ContractConfirmDialog(action: action, onConfirm: onConfirm),
          );
        });
  }

  Future<T?> startRegisterMarshopOTP<T>({
    required RegisterMarshopPayload payload,
    required MarshopRegisterPackResponse pack,
    required User authInfo,
    required MarshopResponse marshop,
    required UpdatePlaceInformationPayload address,
    required int totalPrice,
    required List<RegisterPackProductInfo> productResult,
  }) {
    return Navigator.of(this)
        .pushNamed(RegisterMarShopOTPScreen.routeName, arguments: {
      'payload': payload,
      'pack': pack,
      'authInfo': authInfo,
      'marshop': marshop,
      'address': address,
      'totalPrice': totalPrice,
      'productResult': productResult,
    });
  }
}

// NotificationDialog