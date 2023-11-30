// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_coin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeCoinResponse _$ExchangeCoinResponseFromJson(
        Map<String, dynamic> json) =>
    ExchangeCoinResponse(
      id: json['id'] as num,
      coin: json['coin'] as num,
      coinDiscount: CoinDiscountResponse.fromJson(
          json['coinDiscount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExchangeCoinResponseToJson(
        ExchangeCoinResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coin': instance.coin,
      'coinDiscount': instance.coinDiscount,
    };

CoinDiscountResponse _$CoinDiscountResponseFromJson(
        Map<String, dynamic> json) =>
    CoinDiscountResponse(
      discountRate: json['discountRate'] as num,
      thresholdVnd: json['thresholdVnd'] as num,
    );

Map<String, dynamic> _$CoinDiscountResponseToJson(
        CoinDiscountResponse instance) =>
    <String, dynamic>{
      'thresholdVnd': instance.thresholdVnd,
      'discountRate': instance.discountRate,
    };
