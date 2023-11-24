// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'vnd_wallet_info.freezed.dart';

part 'vnd_wallet_info.g.dart';

@freezed
class VndWalletInfo with _$VndWalletInfo {
  const factory VndWalletInfo({
    int? id,
    int? waiting,
    int? available,
    int? withdraw,
    int? totalCoin,
    int? totalDiamond,
    int? totalVnd,
    int? availableVLive,
    int? availableVShop,
  }) = _VndWalletInfo;

  factory VndWalletInfo.fromJson(Map<String, dynamic> json) =>
      _$VndWalletInfoFromJson(json);
}
