import '../../domain/domain.dart';
import 'status.dart';

extension ColorStatusDiamondExt on DiamondTransactionHistoryType {
  ColorStatus toColorStatus([DiamondTransactionHistoryStatus? status]) {
    if (status == DiamondTransactionHistoryStatus.pending) {
      return ColorStatus.pending;
    }

    switch (this) {
      case DiamondTransactionHistoryType.exchangeDiamondToVnd:
        return ColorStatus.minus;
      case DiamondTransactionHistoryType.receiveGift:
      case DiamondTransactionHistoryType.receiveVote:
      case DiamondTransactionHistoryType.receiveVoucher:
      case DiamondTransactionHistoryType.receiveRegisterCoach:
        return ColorStatus.plus;
    }
  }
}

extension ColorStatusPointExt on PointTransactionHistoryType {
  ColorStatus toColorStatus() {
    switch (this) {
      case PointTransactionHistoryType.rechargePoint:
      case PointTransactionHistoryType.subsidizeContest:
        return ColorStatus.plus;
      case PointTransactionHistoryType.gift:
      case PointTransactionHistoryType.vote:
      case PointTransactionHistoryType.entryFee:
      case PointTransactionHistoryType.sendRegisterCoach:
        return ColorStatus.minus;
    }
  }
}
