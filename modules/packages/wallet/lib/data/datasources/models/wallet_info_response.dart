import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_info_response.g.dart';

@JsonSerializable()
class WalletInfoResponse {
  @JsonKey(name: 'userWallet', includeIfNull: false)
  final UserWallet? userWallet;

  WalletInfoResponse({this.userWallet});

  factory WalletInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WalletInfoResponseToJson(this);
}

@JsonSerializable()
class UserWallet {
  final double? availableCoin;
  final double? pendingCoin;
  final double? availableDiamond;
  final double? pendingDiamond;
  final double? availableVnd;
  final double? pendingVnd;

  UserWallet({
    this.pendingCoin,
    this.availableDiamond,
    this.pendingDiamond,
    this.availableVnd,
    this.pendingVnd,
    this.availableCoin,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) =>
      _$UserWalletFromJson(json);

  Map<String, dynamic> toJson() => _$UserWalletToJson(this);
}
