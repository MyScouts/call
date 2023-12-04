// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetailsResponse _$TransactionDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionDetailsResponse(
      transaction: json['transaction'] == null
          ? null
          : TransactionItem.fromJson(
              json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionDetailsResponseToJson(
        TransactionDetailsResponse instance) =>
    <String, dynamic>{
      'transaction': instance.transaction,
    };
