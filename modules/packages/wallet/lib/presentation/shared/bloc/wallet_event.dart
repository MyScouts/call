part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.getVndWalletInfo() = _GetVndWalletInfoEvent;

  const factory WalletEvent.getDiamondWalletInfo() = _GetDiamondWalletInfo;

  const factory WalletEvent.getCoinWalletInfo() = _GetCoinWalletInfo;

  const factory WalletEvent.reloadVndWalletInfo() = _ReloadVndWalletInfo;

  const factory WalletEvent.reloadDiamondWalletInfo() =
      _ReloadDiamondWalletInfo;


  const factory WalletEvent.getWalletInfo() = _GetWalletInfoEvent;
}
