import 'package:freezed_annotation/freezed_annotation.dart';

import '../../specs/specs.dart';

part 'diamond_transaction_history.freezed.dart';

part 'diamond_transaction_history.g.dart';

@freezed
class DiamondTransactionHistory with _$DiamondTransactionHistory {
  const factory DiamondTransactionHistory({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String value,
    @Default(DiamondTransactionHistoryType.exchangeDiamondToVnd)
    DiamondTransactionHistoryType transactionType,
    @Default('') String content,
    @Default(DiamondTransactionHistoryStatus.success)
    DiamondTransactionHistoryStatus status,
    DateTime? createdAt,
  }) = _DiamondTransactionHistory;

  factory DiamondTransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$DiamondTransactionHistoryFromJson(json);
}
