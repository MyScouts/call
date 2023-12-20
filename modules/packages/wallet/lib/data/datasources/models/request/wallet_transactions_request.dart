import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transactions_request.g.dart';

@JsonSerializable()
class WalletTransactionsRequest {
  final int? page;
  final int pageSize;
  final String? transactionType;
  final num? fromTimestamp;
  final num? toTimestamp;

  WalletTransactionsRequest({
    this.page = 1,
    this.pageSize = 10,
    this.transactionType,
    this.fromTimestamp,
    this.toTimestamp,
  });

  factory WalletTransactionsRequest.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WalletTransactionsRequestToJson(this);
}
