import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../wallet.dart';
import '../../specs/enums/diamond_transaction_history.dart';
import '../meta_data/meta_data.dart';

part 'diamond_transaction_history_detail.freezed.dart';

part 'diamond_transaction_history_detail.g.dart';

@freezed
class DiamondTransactionHistoryDetail with _$DiamondTransactionHistoryDetail {
  const factory DiamondTransactionHistoryDetail({
    @Default(0) int id,
    @Default(0) int userId,
    @Default('') String code,
    @Default('') String senderName,
    @Default('') String senderPDoneId,
    @Default('') String roomId,
    @Default('') String value,
    @Default(DiamondTransactionHistoryType.exchangeDiamondToVnd)
    DiamondTransactionHistoryType transactionType,
    @Default('') String content,
    @Default(DiamondTransactionHistoryStatus.success)
    DiamondTransactionHistoryStatus status,
    DateTime? createdAt,
    MetaData? metaData,
  }) = _DiamondTransactionHistoryDetail;

  factory DiamondTransactionHistoryDetail.fromJson(Map<String, dynamic> json) =>
      _$DiamondTransactionHistoryDetailFromJson(json);
}
