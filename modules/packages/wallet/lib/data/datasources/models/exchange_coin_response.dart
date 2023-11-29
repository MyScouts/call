import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_coin_response.g.dart';

@JsonSerializable()
class ExchangeCoinResponse {
  final num id;
  final num coin;

  ExchangeCoinResponse({
    required this.id,
    required this.coin,
  });

  factory ExchangeCoinResponse.fromJson(Map<String, dynamic> json) =>
      _$ExchangeCoinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeCoinResponseToJson(this);
}
