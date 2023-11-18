import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_wallet_info.freezed.dart';

part 'coin_wallet_info.g.dart';

@freezed
class CoinWalletInfo with _$CoinWalletInfo {
  const factory CoinWalletInfo({
    int? id,
    int? totalCoin,
    int? totalDiamond,
    int? totalVnd,
  }) = _CoinWalletInfo;

  factory CoinWalletInfo.fromJson(Map<String, dynamic> json) =>
      _$CoinWalletInfoFromJson(json);
}
