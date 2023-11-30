import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_coin_response.g.dart';

@JsonSerializable()
class ExchangeCoinResponse {
  final num id;
  final num coin;
  final CoinDiscountResponse coinDiscount;

  ExchangeCoinResponse(
      {required this.id, required this.coin, required this.coinDiscount});

  factory ExchangeCoinResponse.fromJson(Map<String, dynamic> json) =>
      _$ExchangeCoinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeCoinResponseToJson(this);
}

@JsonSerializable()
class CoinDiscountResponse {
  final num thresholdVnd;
  final num discountRate;

  CoinDiscountResponse({
    required this.discountRate,
    required this.thresholdVnd,
  });

  factory CoinDiscountResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinDiscountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDiscountResponseToJson(this);
}
