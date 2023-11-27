import '../../../domain/domain.dart';

class TransactionHistoryConstant {
  TransactionHistoryConstant._();

  static const vShopTypes = [
    TransactionHistoryType.discountFromOrder,
    TransactionHistoryType.discountFromBuyAccount,
    TransactionHistoryType.commissionFromOrder,
    TransactionHistoryType.commissionFromBuyAccount,
    TransactionHistoryType.withdraw,
  ];

  static const vLiveTypes = [
    TransactionHistoryType.commissionFromLivestream,
    TransactionHistoryType.withdraw,
    TransactionHistoryType.discountFromLivestream,
  ];

  static const otherTypeStatus = [
    TransactionHistoryStatus.success,
    TransactionHistoryStatus.failed,
    TransactionHistoryStatus.pending,
  ];

  static const withdrawTypeStatus = TransactionHistoryStatus.values;
}
