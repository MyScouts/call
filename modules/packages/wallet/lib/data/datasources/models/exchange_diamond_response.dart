import 'package:freezed_annotation/freezed_annotation.dart';

part  'exchange_diamond_response.g.dart';

@JsonSerializable()
class ExchangeDiamondResponse {
  final num pendingVnd;
  ExchangeDiamondResponse({
    required this.pendingVnd,
  });

  factory ExchangeDiamondResponse.fromJson(Map<String, dynamic> json) =>
      _$ExchangeDiamondResponseFromJson(json);
}