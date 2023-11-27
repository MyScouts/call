// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TransactionResponse<T> {
  @JsonKey(name: 'transactions', includeIfNull: false)
  final List<T> transactions;
  final int count;

  TransactionResponse({
    required this.transactions,
    this.count = 0,
  });

  factory TransactionResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromT) =>
      _$TransactionResponseFromJson(json, fromT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$TransactionResponseToJson(this, toJsonT);
}
