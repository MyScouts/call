import 'package:freezed_annotation/freezed_annotation.dart';

import '../../specs/enums/point_transaction_history.dart';
import '../../specs/enums/transaction_history.dart';
import '../meta_data/meta_data.dart';

part 'point_transaction_history_detail.freezed.dart';

part 'point_transaction_history_detail.g.dart';

@freezed
class PointTransactionHistoryDetail with _$PointTransactionHistoryDetail {
  const factory PointTransactionHistoryDetail({
    @Default(0) int id,
    @Default('') String code,
    @Default(0) int userId,
    @Default('') String chargerName,
    @Default('') String chargerPDoneId,
    @Default('') String receiverName,
    @Default('') String receiverPDoneId,
    @Default('') String roomId,
    @Default('') String value,
    @Default(PointTransactionHistoryType.rechargePoint)
    PointTransactionHistoryType transactionType,
    @Default('') String content,
    @Default(TransactionHistoryStatus.success) TransactionHistoryStatus status,
    DateTime? createdAt,
    MetaData? metaData,
  }) = _PointTransactionHistoryDetail;

  factory PointTransactionHistoryDetail.fromJson(Map<String, dynamic> json) =>
      _$PointTransactionHistoryDetailFromJson(json);
}
