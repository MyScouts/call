import 'package:freezed_annotation/freezed_annotation.dart';

import '../../specs/specs.dart';

part 'transaction_history.freezed.dart';

part 'transaction_history.g.dart';

@freezed
class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String value,
    @Default('') String content,
    @Default(TransactionHistoryType.discountFromOrder)
    TransactionHistoryType transactionType,
    @Default(TransactionHistoryStatus.success) TransactionHistoryStatus status,
    DateTime? createdAt,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}
