// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsResponse _$TransactionsResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionsResponse(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$TransactionsResponseToJson(
        TransactionsResponse instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'total': instance.total,
    };

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    TransactionItem(
      id: json['id'] as String?,
      sender: json['sender'] == null
          ? null
          : User.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : User.fromJson(json['receiver'] as Map<String, dynamic>),
      fromValue: (json['fromValue'] as num?)?.toDouble(),
      fromType: json['fromType'] as int?,
      toValue: (json['toValue'] as num?)?.toDouble(),
      toType: json['toType'] as int?,
      transactionType: json['transactionType'] as String?,
      category: json['category'] as int?,
      status: json['status'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TransactionItemToJson(TransactionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'fromValue': instance.fromValue,
      'fromType': instance.fromType,
      'toValue': instance.toValue,
      'toType': instance.toType,
      'transactionType': instance.transactionType,
      'category': instance.category,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
