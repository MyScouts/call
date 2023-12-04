import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_coin_request.g.dart';

@JsonSerializable()
class BuyCoinRequest {
  final num vnd;
  final num expectedCoin;
  final String pDoneId;

  BuyCoinRequest({
    required this.vnd,
    required this.pDoneId,
    required this.expectedCoin
  });

  factory BuyCoinRequest.fromJson(Map<String, dynamic> json) =>
      _$BuyCoinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BuyCoinRequestToJson(this);
}