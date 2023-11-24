import '../../../domain/domain.dart';

class TransactionHistoryConstant {
  TransactionHistoryConstant._();

  static const vShopTypes = [
    TransactionHistoryType.withdraw,
  ];

  static const vLiveTypes = [
    TransactionHistoryType.withdraw,
  ];

  static const otherTypeStatus = [
    TransactionHistoryStatus.success,
    TransactionHistoryStatus.failed,
    TransactionHistoryStatus.pending,
  ];

  static const withdrawTypeStatus = TransactionHistoryStatus.values;
}
