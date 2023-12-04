// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transactions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletTransactionsRequest _$WalletTransactionsRequestFromJson(
        Map<String, dynamic> json) =>
    WalletTransactionsRequest(
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      category: json['category'] as String?,
      fromTimestamp: json['fromTimestamp'] as num?,
      toTimestamp: json['toTimestamp'] as num?,
    );

Map<String, dynamic> _$WalletTransactionsRequestToJson(
        WalletTransactionsRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'category': instance.category,
      'fromTimestamp': instance.fromTimestamp,
      'toTimestamp': instance.toTimestamp,
    };
