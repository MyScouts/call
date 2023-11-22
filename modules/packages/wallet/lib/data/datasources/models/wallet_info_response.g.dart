// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletInfoResponse _$WalletInfoResponseFromJson(Map<String, dynamic> json) =>
    WalletInfoResponse(
      userWallet: json['userWallet'] == null
          ? null
          : UserWallet.fromJson(json['userWallet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WalletInfoResponseToJson(WalletInfoResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userWallet', instance.userWallet);
  return val;
}

UserWallet _$UserWalletFromJson(Map<String, dynamic> json) => UserWallet(
      pendingCoin: (json['pendingCoin'] as num?)?.toDouble(),
      availableDiamond: (json['availableDiamond'] as num?)?.toDouble(),
      pendingDiamond: (json['pendingDiamond'] as num?)?.toDouble(),
      availableVnd: (json['availableVnd'] as num?)?.toDouble(),
      pendingVnd: (json['pendingVnd'] as num?)?.toDouble(),
      availableCoin: (json['availableCoin'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserWalletToJson(UserWallet instance) =>
    <String, dynamic>{
      'availableCoin': instance.availableCoin,
      'pendingCoin': instance.pendingCoin,
      'availableDiamond': instance.availableDiamond,
      'pendingDiamond': instance.pendingDiamond,
      'availableVnd': instance.availableVnd,
      'pendingVnd': instance.pendingVnd,
    };
