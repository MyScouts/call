// ignore_for_file: constant_identifier_names
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:wallet/core/core.dart';

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
        return 'XXXXXXXXXXXXXX';
      case BankAccountField.bankAccountHolder:
        return 'Nhập đầy họ tên chủ tài khoản';
    }
  }

  String get title {
    switch (this) {
      case BankAccountField.bankName:
        return 'Tên ngân hàng';
      case BankAccountField.bankAccountNumber:
        return 'Số tài khoản';
      case BankAccountField.bankAccountHolder:
        return 'Họ và tên chủ tài khoản';
    }
  }
}

enum WalletType { ddone, coin, diamond, vnd }

extension WalletTypeExt on WalletType {
  Widget get icon {
    switch (this) {
      case WalletType.ddone:
        return ImageWidget(ImageConstants.icWalletDDone, width: 20, height: 20);
      case WalletType.coin:
        return ImageWidget(ImageConstants.icWalletCoin, width: 20, height: 20);
      case WalletType.diamond:
        return ImageWidget(
          ImageConstants.icWalletDiamond,
          width: 20,
          height: 20,
        );
      case WalletType.vnd:
        return ImageWidget(ImageConstants.icWalletVnd, width: 20, height: 20);
    }
  }

  Widget iconTransaction(BuildContext context,
      {double size = 20, double textSize = 16}) {
    switch (this) {
      case WalletType.ddone:
        return ImageWidget(ImageConstants.icWalletDDone,
            width: size, height: size);
      case WalletType.coin:
        return ImageWidget(ImageConstants.icWalletCoin,
            width: size, height: size);
      case WalletType.diamond:
        return ImageWidget(
          ImageConstants.icWalletDiamond,
          width: size,
          height: size,
        );
      case WalletType.vnd:
        return Text(
          'vnđ',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: textSize,
                fontWeight: FontWeight.w600,
                height: 24 / textSize,
                color: const Color(0xFF4B84F7),
              ),
        );
    }
  }

  Color get valueColor {
    switch (this) {
      case WalletType.ddone:
        return WalletTheme.ddoneColor;
      case WalletType.coin:
        return WalletTheme.coinColor;
      case WalletType.diamond:
        return WalletTheme.diamondColor;
      case WalletType.vnd:
        return WalletTheme.vndColor;
    }
  }

  Color get valueBgColor {
    switch (this) {
      case WalletType.ddone:
        return WalletTheme.ddoneBgColor;
      case WalletType.coin:
        return WalletTheme.coinBgColor;
      case WalletType.diamond:
        return WalletTheme.diamondBgColor;
      case WalletType.vnd:
        return WalletTheme.vndBgColor;
    }
  }

  String get resourceTabText {
    switch (this) {
      case WalletType.ddone:
        return 'D-One';
      case WalletType.coin:
        return 'Xu';
      case WalletType.diamond:
        return 'Kim cương';
      case WalletType.vnd:
        return 'VNĐ';
    }
  }

  static Color get blueBackgroundColor {
    return const Color.fromRGBO(75, 132, 247, 1);
  }
}

enum RechargeType { byMoney, byCoin }

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

  static Color get blueBackgroundColor {
    return const Color.fromRGBO(75, 132, 247, 1);
  }
}

enum TransactionCategory { MARSHOP, LIVE }

extension TransactionCategoryExt on TransactionCategory {
  String get text {
    switch (this) {
      case TransactionCategory.MARSHOP:
        return 'Marshop';
      case TransactionCategory.LIVE:
        return 'V-Live';
    }
  }
}

enum TransactionValueType {
  COIN(0),
  DIAMOND(1),
  VND(2),
  D_ONE(3),
  PENDING_DIAMOND(21),
  PENDING_VND(22),
  WITHDRAWING_VND(32),
  CASH(99);

  final int value;

  static TransactionValueType getInstance(int val) {
    return TransactionValueType.values
        .firstWhere((element) => val == element.value);
  }

  const TransactionValueType(this.value);
}

enum TransactionResolvedStatus {
  failed,
  succeed,
  rejected,
  pending;
}

extension TransactionStatusExt on TransactionResolvedStatus {
  String get text {
    switch (this) {
      case TransactionResolvedStatus.pending:
        return 'Chờ xác nhận';
      case TransactionResolvedStatus.succeed:
        return 'Thành công';
      case TransactionResolvedStatus.failed:
        return 'Thất bại';
      case TransactionResolvedStatus.rejected:
        return 'Bị từ chối';
    }
  }

  Color get color {
    switch (this) {
      case TransactionResolvedStatus.pending:
        return const Color(0xFFFFA41C);
      case TransactionResolvedStatus.succeed:
        return const Color(0xFF00A65F);
      case TransactionResolvedStatus.failed:
      case TransactionResolvedStatus.rejected:
        return const Color(0xFFDE372D);
    }
  }
}

enum TransactionType {
  LIVE_GIFT('LIVE_GIFT'),
  LIVE_VOTE('LIVE_VOTE'),
  WITHDRAW_FROM_LIVE('WITHDRAW_FROM_LIVE'),
  DIAMOND_TO_VND('DIAMOND_TO_VND'),
  BUY_COIN_FROM_AGENCY('BUY_COIN_FROM_AGENCY'),
  MARSHOP_COMMISSION('MARSHOP_COMMISSION'),
  WITHDRAW_FROM_MARSHOP('WITHDRAW_FROM_MARSHOP'),
  GROUP_INCOME('GROUP_INCOME'),
  TEAM_INCOME('TEAM_INCOME'),
  DIAMOND_AVAILABLE('DIAMOND_AVAILABLE'),
  VND_AVAILABLE('VND_AVAILABLE'),
  REQUEST_WITHDRAW_VND('REQUEST_WITHDRAW_VND'),
  LUCKY_WHEEL('LUCKY_WHEEL'),
  WITHDRAW_VND_COMPLETED('WITHDRAW_VND_COMPLETED');

  static TransactionType getInstance(String val) {
    return TransactionType.values.firstWhere((element) => val == element.value);
  }

  final String value;

  const TransactionType(this.value);
}

extension TransactionTypeExt on TransactionType {
  String filterText({required WalletType walletType}) {
    switch (this) {
      case TransactionType.LIVE_GIFT:
        if (walletType == WalletType.diamond) {
          return 'Nhận quà';
        } else {
          return 'Tặng quà';
        }
      case TransactionType.LIVE_VOTE:
        if (walletType == WalletType.diamond) {
          return 'Nhận vote';
        } else {
          return 'Tặng vote';
        }
      case TransactionType.WITHDRAW_FROM_LIVE:
      case TransactionType.WITHDRAW_FROM_MARSHOP:
      case TransactionType.REQUEST_WITHDRAW_VND:
        return 'Rút tiền từ ví VNĐ';
      case TransactionType.DIAMOND_TO_VND:
        return 'Đổi kim cương';
      case TransactionType.BUY_COIN_FROM_AGENCY:
        return 'Mua xu';
      case TransactionType.MARSHOP_COMMISSION:
        return 'Hoa hồng đơn hàng';
      case TransactionType.GROUP_INCOME:
        return 'Nhận tiền từ Group';
      case TransactionType.TEAM_INCOME:
        return 'Nhận tiền từ Team';
      case TransactionType.DIAMOND_AVAILABLE:
        return 'Nhận từ Kim cương chờ duyệt';
      case TransactionType.VND_AVAILABLE:
        return 'Nhận từ ví VNĐ chờ duyệt';
      case TransactionType.WITHDRAW_VND_COMPLETED:
        return 'Rút tiền về tài khoản ngân hàng';
      case TransactionType.LUCKY_WHEEL:
        return 'Vòng quay may mắn';
    }
  }

  String title(BuildContext context, {required String? receiverPDoneId}) {
    final myId = WalletInjectedData.user.pDoneId;
    switch (this) {
      case TransactionType.LIVE_GIFT:
        return myId == receiverPDoneId ? 'Nhận quà' : 'Tặng quà';
      case TransactionType.LIVE_VOTE:
        return myId == receiverPDoneId ? 'Nhận vote' : 'Tặng vote';
      case TransactionType.DIAMOND_TO_VND:
        return 'Đổi kim cương';
      case TransactionType.BUY_COIN_FROM_AGENCY:
        return 'Mua xu';
      case TransactionType.GROUP_INCOME:
        return 'Nhận tiền từ Group';
      case TransactionType.TEAM_INCOME:
        return 'Nhận tiền từ Team';
      case TransactionType.DIAMOND_AVAILABLE:
        return 'Nhận từ Kim cương chờ duyệt';
      case TransactionType.VND_AVAILABLE:
        return 'Nhận từ ví VNĐ chờ duyệt';
      case TransactionType.MARSHOP_COMMISSION:
        return 'Hoa hồng từ đơn hàng';
      case TransactionType.WITHDRAW_FROM_LIVE:
      case TransactionType.WITHDRAW_FROM_MARSHOP:
      case TransactionType.REQUEST_WITHDRAW_VND:
        return 'Rút tiền từ ví VNĐ';
      case TransactionType.WITHDRAW_VND_COMPLETED:
        return 'Rút tiền về tài khoản ngân hàng';
      case TransactionType.LUCKY_WHEEL:
        return 'Vòng quay may mắn';
    }
  }

  String operator(BuildContext context,
      {required String? receiverPDoneId, required WalletType walletType}) {
    final myId = WalletInjectedData.user.pDoneId;

    switch (this) {
      case TransactionType.LIVE_GIFT:
      case TransactionType.LIVE_VOTE:
        return myId == receiverPDoneId ? '+' : '-';
      case TransactionType.DIAMOND_TO_VND:
        if (walletType == WalletType.diamond) {
          return '-';
        } else {
          return '+';
        }
      case TransactionType.BUY_COIN_FROM_AGENCY:
        return '+';
      case TransactionType.GROUP_INCOME:
      case TransactionType.TEAM_INCOME:
        return '+';
      case TransactionType.DIAMOND_AVAILABLE:
        return '+';
      case TransactionType.VND_AVAILABLE:
        return '+';
      case TransactionType.MARSHOP_COMMISSION:
        return '+';
      case TransactionType.WITHDRAW_FROM_LIVE:
      case TransactionType.WITHDRAW_FROM_MARSHOP:
      case TransactionType.REQUEST_WITHDRAW_VND:
        return '-';
      case TransactionType.WITHDRAW_VND_COMPLETED:
        return '';
      case TransactionType.LUCKY_WHEEL:
        return '+';
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
