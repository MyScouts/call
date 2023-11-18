enum WalletPointActionType {
  pointAgency,
  transactionHistory,
}

extension WalletPointActionTypeName on WalletPointActionType {
  String get text {
    switch (this) {
      case WalletPointActionType.pointAgency:
        return 'Tìm đại lý xu';
      case WalletPointActionType.transactionHistory:
        return 'Lịch sử giao dịch';
    }
  }
}

class WalletPointConstant {
  static const chargeCoinMessage =
      '*Xu quy đổi là tham khảo, hãy liên hệ với đại lý để thực hiện giao dịch';
}
