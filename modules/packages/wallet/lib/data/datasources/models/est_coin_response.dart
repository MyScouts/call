import 'package:freezed_annotation/freezed_annotation.dart';

part 'est_coin_response.g.dart';

@JsonSerializable()
class EstCoinResponse {
  final num vnd;
  final num coin;
  final num bonusCoin;

  EstCoinResponse({
    required this.vnd,
    required this.coin,
    required this.bonusCoin,
  });

  factory EstCoinResponse.fromJson(Map<String, dynamic> json) =>
      _$EstCoinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EstCoinResponseToJson(this);
}
