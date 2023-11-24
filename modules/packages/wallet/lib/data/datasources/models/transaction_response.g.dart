// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse<T> _$TransactionResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TransactionResponse<T>(
      transactions:
          (json['transactions'] as List<dynamic>).map(fromJsonT).toList(),
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$TransactionResponseToJson<T>(
  TransactionResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'transactions': instance.transactions.map(toJsonT).toList(),
      'count': instance.count,
    };
