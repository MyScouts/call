import '../../domain/domain.dart';

extension TitleTypeFilterExt on TransactionHistoryType {
  String get vShopTitle {
    switch (this) {
      case TransactionHistoryType.withdraw:
        return 'Rút tiền từ V-Shop';
      case TransactionHistoryType.discountFromOrder:
        return 'Chiết khấu từ đơn hàng';
      case TransactionHistoryType.discountFromBuyAccount:
        return 'Chiết khấu mua tài khoản';
      case TransactionHistoryType.commissionFromOrder:
        return 'Hoa hồng từ đơn hàng';
      case TransactionHistoryType.commissionFromBuyAccount:
        return 'Hoa hồng mua tài khoản';
      case TransactionHistoryType.discountFromLivestream:
      case TransactionHistoryType.commissionFromLivestream:
        return '';
    }
  }

  String get vLiveTitle {
    switch (this) {
      case TransactionHistoryType.discountFromOrder:
      case TransactionHistoryType.discountFromBuyAccount:
      case TransactionHistoryType.discountFromLivestream:
        return 'Chiết khấu từ Livestream';
      case TransactionHistoryType.commissionFromOrder:
      case TransactionHistoryType.commissionFromBuyAccount:
      case TransactionHistoryType.commissionFromLivestream:
        return 'Hoa hồng từ Livestream';
      case TransactionHistoryType.withdraw:
        return 'Rút tiền từ V-Live';
    }
  }
}

extension TitleStatusFilterExt on TransactionHistoryStatus {
  String get title {
    switch (this) {
      case TransactionHistoryStatus.success:
        return 'Thành công';
      case TransactionHistoryStatus.failed:
        return 'Thất bại';
      case TransactionHistoryStatus.pending:
        return 'Chờ xác nhận';
      case TransactionHistoryStatus.waitingWithdraw:
        return 'Chờ rút';
    }
  }

  String getTitleFromType([TransactionHistoryType? type]) {
    final map = {
      TransactionHistoryStatus.success: 'Thành công',
      TransactionHistoryStatus.failed: 'Thất bại',
      TransactionHistoryStatus.pending:
          type == TransactionHistoryType.withdraw ? 'Chờ rút' : 'Chờ xác nhận',
      TransactionHistoryStatus.waitingWithdraw: 'Chờ rút',
    };

    return map[this] ?? '';
  }
}

extension TitleDiamondTypeFilterExt on DiamondTransactionHistoryType {
  String get title {
    switch (this) {
      case DiamondTransactionHistoryType.exchangeDiamondToVnd:
        return 'Đổi kim cương';
      case DiamondTransactionHistoryType.receiveGift:
        return 'Nhận quà';
      case DiamondTransactionHistoryType.receiveVote:
        return 'Nhận vote';
      case DiamondTransactionHistoryType.receiveVoucher:
        return 'Nhận voucher';
      case DiamondTransactionHistoryType.receiveRegisterCoach:
        return 'Phí huấn luyện';
    }
  }
}

extension TitleDiamondStatusFilterExt on DiamondTransactionHistoryStatus {
  String get title {
    switch (this) {
      case DiamondTransactionHistoryStatus.success:
        return 'Thành công';
      case DiamondTransactionHistoryStatus.failed:
        return 'Thất bại';
      case DiamondTransactionHistoryStatus.pending:
        return 'Chờ xác nhận';
    }
  }
}

extension TitlePointTypeFilterExt on PointTransactionHistoryType {
  String get title {
    switch (this) {
      case PointTransactionHistoryType.rechargePoint:
        return 'Nạp xu';
      case PointTransactionHistoryType.gift:
        return 'Tặng quà';
      case PointTransactionHistoryType.vote:
        return 'Tặng vote';
      case PointTransactionHistoryType.entryFee:
        return 'Phí vào phòng';
      case PointTransactionHistoryType.sendRegisterCoach:
        return 'Trả phí HLV';
      case PointTransactionHistoryType.subsidizeContest:
        return 'Quà tặng';
    }
  }
}
