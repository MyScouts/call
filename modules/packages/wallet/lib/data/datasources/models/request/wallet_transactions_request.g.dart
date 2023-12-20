// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transactions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletTransactionsRequest _$WalletTransactionsRequestFromJson(
        Map<String, dynamic> json) =>
    WalletTransactionsRequest(
      page: json['page'] as int? ?? 1,
      pageSize: json['pageSize'] as int? ?? 10,
      transactionType: json['transactionType'] as String?,
      fromTimestamp: json['fromTimestamp'] as num?,
      toTimestamp: json['toTimestamp'] as num?,
    );

Map<String, dynamic> _$WalletTransactionsRequestToJson(
        WalletTransactionsRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'transactionType': instance.transactionType,
      'fromTimestamp': instance.fromTimestamp,
      'toTimestamp': instance.toTimestamp,
    };
