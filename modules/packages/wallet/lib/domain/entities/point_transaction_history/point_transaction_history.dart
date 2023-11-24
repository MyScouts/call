import 'package:freezed_annotation/freezed_annotation.dart';

import '../../specs/specs.dart';

part 'point_transaction_history.freezed.dart';
part 'point_transaction_history.g.dart';

@freezed
class PointTransactionHistory with _$PointTransactionHistory {
  const factory PointTransactionHistory({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String value,
    @Default(PointTransactionHistoryType.rechargePoint)
    PointTransactionHistoryType transactionType,
    @Default('') String content,
    DateTime? createdAt,
  }) = _PointTransactionHistory;

  factory PointTransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$PointTransactionHistoryFromJson(json);
}
