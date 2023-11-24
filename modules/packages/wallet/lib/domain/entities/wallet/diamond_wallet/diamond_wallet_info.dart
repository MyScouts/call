import 'package:freezed_annotation/freezed_annotation.dart';

part 'diamond_wallet_info.freezed.dart';

part 'diamond_wallet_info.g.dart';

@freezed
class DiamondWalletInfo with _$DiamondWalletInfo {
  const factory DiamondWalletInfo({
    int? id,
    int? totalCoin,
    int? totalDiamond,
    int? totalVnd,
    int? waiting,
    int? available,
  }) = _DiamondWalletInfo;

  factory DiamondWalletInfo.fromJson(Map<String, dynamic> json) =>
      _$DiamondWalletInfoFromJson(json);
}
