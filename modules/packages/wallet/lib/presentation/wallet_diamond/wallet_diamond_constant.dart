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
