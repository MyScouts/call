import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

enum WalletPointActionType {
  pointAgency,
  transactionHistory,
}

extension WalletPointActionTypeName on WalletPointActionType {
  String get text {
    switch (this) {
      case WalletPointActionType.pointAgency:
        return 'Nạp xu thông qua đại lý xu';
      case WalletPointActionType.transactionHistory:
        return 'Lịch sử giao dịch';
    }
  }
  String get desc {
    switch (this) {
      case WalletPointActionType.pointAgency:
        return 'Tìm các đại lý xu tại đây';
      case WalletPointActionType.transactionHistory:
        return 'Xem chi tiết lịch sử các giao dịch';
    }
  }

  Widget get icon {
    switch (this) {
      case WalletPointActionType.pointAgency:
        return ImageWidget(ImageConstants.imgFindAgency, width: 40);
      case WalletPointActionType.transactionHistory:
        return ImageWidget(ImageConstants.imgTransactionHistory, width: 40);
    }
  }
}

class WalletPointConstant {
  static const chargeCoinMessage =
      '*Xu quy đổi là tham khảo, hãy liên hệ với đại lý để thực hiện giao dịch';
}
