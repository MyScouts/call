import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/domain/domain.dart';

part 'wallet_coin_payment_information_response.g.dart';

@JsonSerializable()
class WalletCoinPaymentInformation {
  final num vnd;
  final num bonusCoin;
  final num coin;
  final String content;
  final BankAccount bankAccount;

  WalletCoinPaymentInformation(
      {required this.vnd,
      required this.bonusCoin,
      required this.coin,
      required this.content,
      required this.bankAccount});

  factory WalletCoinPaymentInformation.fromJson(Map<String, dynamic> json) {
    return _$WalletCoinPaymentInformationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WalletCoinPaymentInformationToJson(this);
}
