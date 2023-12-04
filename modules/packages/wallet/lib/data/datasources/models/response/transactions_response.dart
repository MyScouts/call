import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_response.g.dart';

@JsonSerializable()
class TransactionsResponse {
  final List<TransactionItem>? transactions;
  final int? total;

  TransactionsResponse({this.transactions, this.total});

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsResponseToJson(this);
}

@JsonSerializable()
class TransactionItem {
  final String? id;
  final double? fromValue;
  final int? fromType;
  final double? toValue;
  final int? toType;
  final String? transactionType;
  final String? category;
  final int? status;
  final String? resolvedStatus;
  final DateTime? createdAt;
  final Map<String, dynamic>? metadata;
  final User? sender;
  final User? receiver;

  TransactionItem({
    this.id,
    this.sender,
    this.receiver,
    this.fromValue,
    this.fromType,
    this.toValue,
    this.toType,
    this.transactionType,
    this.category,
    this.status,
    this.createdAt,
    this.resolvedStatus,
    this.metadata,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);
}