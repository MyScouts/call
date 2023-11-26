import 'package:freezed_annotation/freezed_annotation.dart';

import '../../specs/specs.dart';
import '../bank_account/bank_account.dart';

part 'transaction_history_detail.freezed.dart';

part 'transaction_history_detail.g.dart';

@freezed
class TransactionHistoryDetail with _$TransactionHistoryDetail {
  const factory TransactionHistoryDetail({
    @Default(0) int id,
    @Default('') String code,
    @Default(0) int userId,
    @Default('') String receiverPDoneId,
    @Default('') String executorPDoneId,
    @Default('') String sellerPDoneId,
    @Default('') String buyerPDoneId,
    @Default('') String presenterPDoneId,
    @Default('') String representativePDoneId,
    @Default('') String value,
    @Default('') String diamondValue,
    @Default(TransactionHistoryType.commissionFromOrder)
    TransactionHistoryType transactionType,
    @Default('') String taxValue,
    @Default('') String content,
    @Default(TransactionHistoryVendor.vShop)
    TransactionHistoryVendor fromSource,
    @Default(TransactionHistoryStatus.success) TransactionHistoryStatus status,
    BankAccountTransactionHistory? bankAccount,
    DateTime? createdAt,
  }) = _TransactionHistoryDetail;

  factory TransactionHistoryDetail.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryDetailFromJson(json);
}
