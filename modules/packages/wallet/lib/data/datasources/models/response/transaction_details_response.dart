import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/data/datasources/models/response/transactions_response.dart';

part 'transaction_details_response.g.dart';

@JsonSerializable()
class TransactionDetailsResponse {
  final TransactionItem? transaction;

  TransactionDetailsResponse({this.transaction});

  factory TransactionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDetailsResponseToJson(this);
}
