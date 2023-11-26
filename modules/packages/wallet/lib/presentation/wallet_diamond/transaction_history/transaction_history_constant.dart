import '../../../domain/domain.dart';

class TransactionHistoryConstant {
  TransactionHistoryConstant._();

  static const otherTypeStatus = [
    TransactionHistoryStatus.success,
    TransactionHistoryStatus.failed,
    TransactionHistoryStatus.pending,
  ];

  static const withdrawTypeStatus = TransactionHistoryStatus.values;
}
