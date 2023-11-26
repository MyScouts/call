import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

enum WalletDiamondActionType {
  chargeDiamondToVnd,
  transactionHistory,
}

extension WalletDiamondActionTypeName on WalletDiamondActionType {
  String get text {
    switch (this) {
      case WalletDiamondActionType.chargeDiamondToVnd:
        return 'Đổi kim cương sang VNĐ';
      case WalletDiamondActionType.transactionHistory:
        return 'Lịch sử giao dịch';
    }
  }

  Widget get icon {
    switch (this) {
      case WalletDiamondActionType.chargeDiamondToVnd:
        return ImageWidget(ImageConstants.imgChargeDiamond, width: 40);
      case WalletDiamondActionType.transactionHistory:
        return ImageWidget(ImageConstants.imgTransactionHistory, width: 40);
    }
  }

  String get desc {
    switch (this) {
      case WalletDiamondActionType.chargeDiamondToVnd:
        return 'Quy đổi từ Kim Cương sang VNĐ';
      case WalletDiamondActionType.transactionHistory:
        return 'Xem chi tiết lịch sử các giao dịch';
    }
  }
}

enum WalletDiamondStatus {
  // Chờ xác nhận
  pending,
  // Số dư khả dụng
  available,
}

extension WalletDiamondStatusName on WalletDiamondStatus {
  String get text {
    switch (this) {
      case WalletDiamondStatus.pending:
        return 'Chờ xác nhận';
      case WalletDiamondStatus.available:
        return 'Số dư khả dụng';
    }
  }
}

enum WalletDiamondField {
  diamond,
  vnd,
}
