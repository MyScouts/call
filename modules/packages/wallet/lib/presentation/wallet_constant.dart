import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:intl/intl.dart';
import 'package:wallet/core/core.dart';

enum UserType { isDefault, isPDone, isJA }

extension UserExt on BuildContext {
  UserType get userType {
    final user = WalletInjectedData.user;

    if (user.isPDone == false) {
      return UserType.isDefault;
    }
    if (user.isJA == false) {
      return UserType.isPDone;
    }
    return UserType.isJA;
  }
}

extension UserTypeExt on UserType {
  List<WalletType> get walletCanShow {
    switch (this) {
      case UserType.isDefault:
        return [WalletType.coin];
      case UserType.isPDone:
        return [WalletType.coin, WalletType.diamond];
      case UserType.isJA:
        return [WalletType.coin, WalletType.diamond, WalletType.coinVnd];
    }
  }
}

enum WalletType { coin, diamond, coinVnd, live, vshop }

extension WalletTypeExt on WalletType {
  String get walletNameInDialog {
    switch (this) {
      case WalletType.live:
      case WalletType.vshop:
      case WalletType.coinVnd:
        return 'ví VNĐ';
      case WalletType.coin:
        return 'ví xu';
      case WalletType.diamond:
        return 'ví kim cương';
    }
  }

  String get icon {
    switch (this) {
      case WalletType.coinVnd:
        return IconAppConstants.camera2;
      case WalletType.coin:
        return IconAppConstants.camera2;
      case WalletType.diamond:
        return IconAppConstants.camera2;
      case WalletType.live:
        return IconAppConstants.camera2;
      case WalletType.vshop:
        return IconAppConstants.camera2;
    }
  }

  String get walletTypeText {
    switch (this) {
      case WalletType.coinVnd:
        return 'VNĐ';
      case WalletType.coin:
        return 'Xu';
      case WalletType.diamond:
        return 'Kim cương';
      case WalletType.live:
        return 'V-Live';
      case WalletType.vshop:
        return 'V-Shop';
    }
  }

  String get name {
    switch (this) {
      case WalletType.coinVnd:
      case WalletType.coin:
      case WalletType.diamond:
      case WalletType.live:
        return 'v_live';
      case WalletType.vshop:
        return 'v_shop';
    }
  }

  int get initialIndexTabBar {
    switch (this) {
      case WalletType.coin:
        return 0;
      case WalletType.diamond:
        return 1;
      case WalletType.live:
      case WalletType.vshop:
      case WalletType.coinVnd:
        return 2;
    }
  }
}

enum WalletVNDActionType {
  bankAccountInfo,
  transactionHistory,
  withdrawalOrder,
}

extension WalletVNDActionTypeExt on WalletVNDActionType {
  String get text {
    switch (this) {
      case WalletVNDActionType.bankAccountInfo:
        return 'Thông tin tài khoản ngân hàng';
      case WalletVNDActionType.withdrawalOrder:
        return 'Đặt lệnh rút tiền';
      case WalletVNDActionType.transactionHistory:
        return 'Lịch sử giao dịch';
    }
  }

  String get desc {
    switch (this) {
      case WalletVNDActionType.bankAccountInfo:
        return 'Bạn có thể liên kết thêm ngân hàng ở đây';
      case WalletVNDActionType.withdrawalOrder:
        return 'Bạn có thể đặt lệnh rút tiền tại đây';
      case WalletVNDActionType.transactionHistory:
        return 'Xem chi tiết lịch sử các giao dịch';
    }
  }

  Widget get icon {
    switch (this) {
      case WalletVNDActionType.bankAccountInfo:
        return ImageWidget(ImageConstants.imgBankInfo, width: 40);
      case WalletVNDActionType.withdrawalOrder:
        return ImageWidget(ImageConstants.imgWithDraw, width: 40);
      case WalletVNDActionType.transactionHistory:
        return ImageWidget(ImageConstants.imgTransactionHistory, width: 40);
    }
  }
}

enum WalletVNDStatus { waiting, available, withdraw }

extension WalletVNDStatusExt on WalletVNDStatus {
  String get text {
    switch (this) {
      case WalletVNDStatus.waiting:
        return 'Chờ xác nhận';
      case WalletVNDStatus.available:
        return 'Số dư khả dụng';
      case WalletVNDStatus.withdraw:
        return 'Chờ rút';
    }
  }
}

extension VNDWalletExt on BuildContext {
  double get vndWalletStatusWidth =>
      (MediaQuery.of(this).size.width - 2 * horizontal - 10) / 3;

  TextStyle? get vndWalletStatusTextStyle =>
      text.bodyMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 12);
}

enum BankAccountField {
  bankName,
  bankAccountNumber,
  bankAccountHolder,
}

extension BankAccountFieldExt on BankAccountField {
  String get hintText {
    switch (this) {
      case BankAccountField.bankName:
        return 'Chọn ngân hàng';
      case BankAccountField.bankAccountNumber:
        return 'Nhập số tài khoản';
      case BankAccountField.bankAccountHolder:
        return 'Nhập tên chủ tài khoản';
    }
  }

  String get title {
    switch (this) {
      case BankAccountField.bankName:
        return 'Tên ngân hàng:';
      case BankAccountField.bankAccountNumber:
        return 'Số tài khoản:';
      case BankAccountField.bankAccountHolder:
        return 'Tên chủ tài khoản:';
    }
  }
}

enum ResourceType { ddone, coin, diamond, vnd }

extension ResourceTypeExt on ResourceType {
  Widget get icon {
    switch (this) {
      case ResourceType.ddone:
        return ImageWidget(ImageConstants.icWalletDDone, width: 20, height: 20);
      case ResourceType.coin:
        return ImageWidget(ImageConstants.icWalletCoin, width: 20, height: 20);
      case ResourceType.diamond:
        return ImageWidget(ImageConstants.icWalletDiamond,
            width: 20, height: 20);
      case ResourceType.vnd:
        return ImageWidget(ImageConstants.icWalletVnd, width: 20, height: 20);
    }
  }

  Color get valueColor {
    switch (this) {
      case ResourceType.ddone:
        return WalletTheme.ddoneColor;
      case ResourceType.coin:
        return WalletTheme.coinColor;
      case ResourceType.diamond:
        return WalletTheme.diamondColor;
      case ResourceType.vnd:
        return WalletTheme.vndColor;
    }
  }

  Color get valueBgColor {
    switch (this) {
      case ResourceType.ddone:
        return WalletTheme.ddoneBgColor;
      case ResourceType.coin:
        return WalletTheme.coinBgColor;
      case ResourceType.diamond:
        return WalletTheme.diamondBgColor;
      case ResourceType.vnd:
        return WalletTheme.vndBgColor;
    }
  }

  String get resourceTabText {
    switch (this) {
      case ResourceType.ddone:
        return 'D-One';
      case ResourceType.coin:
        return 'Xu';
      case ResourceType.diamond:
        return 'Kim cương';
      case ResourceType.vnd:
        return 'VNĐ';
    }
  }

  static Color get blueBackgroundColor{
    return const Color.fromRGBO(75, 132, 247, 1);
  }
}

enum RechargeType { byMoney, byCoin}

extension RechargeTypeExt on RechargeType {
  Color get valueColor {
    switch (this) {
      case RechargeType.byMoney:
        return WalletTheme.ddoneColor;
      case RechargeType.byCoin:
        return WalletTheme.coinColor;
    }
  }


  String get resourceTabText {
    switch (this) {
      case RechargeType.byMoney:
        return 'Nhập theo số tiền';
      case RechargeType.byCoin:
        return 'Nhập theo số xu';
    }
  }

  static Color get blueBackgroundColor{
    return const Color.fromRGBO(75, 132, 247, 1);
  }
}

enum TransactionCategory { marshop, vlive }

extension TransactionCategoryExt on TransactionCategory {
  String get text {
    switch (this) {
      case TransactionCategory.marshop:
        return 'Marshop';
      case TransactionCategory.vlive:
        return 'V-Live';
    }
  }
}

class WalletConstant {
  static const qrCodeMessage =
      // ignore: lines_longer_than_80_chars
      'Tải ảnh mã QR ngân hàng của bạn,để các giao dịch nhanh chóng và chính xác';

  // ignore: lines_longer_than_80_chars
  static const registerJADialogText =
      '''Để đổi kim cương sang vnđ bạn cần phải đăng ký mã JA\n(Đăng ký JA bạn cần trên 15 tuổi)''';

  static const otpLength = 6;

  static final borderRadius2 = BorderRadius.circular(2);

  static final borderRadius5 = BorderRadius.circular(5);

  static final borderRadius6 = BorderRadius.circular(6);

  static final borderRadius8 = BorderRadius.circular(8);

  static final borderRadius10 = BorderRadius.circular(10);

  static final borderRadius12 = BorderRadius.circular(12);

  static final borderRadius15 = BorderRadius.circular(15);

  static final borderRadius16 = BorderRadius.circular(16);

  static final borderRadius90 = BorderRadius.circular(90);

  // 2018 -> 2023
  static final yearFilter = List.generate(6, (index) => 2018 + index);

  // 1 -> 12

  static final monthFilter = List.generate(12, (index) => index + 1);

  static const timeInputLimit = 60;
}

