part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = _Initial;

  const factory WalletState.error(String err) = _Error;

  const factory WalletState.vndWalletInfoLoading() = _VndWalletInfoLoading;

  const factory WalletState.vndWalletInfoLoaded(VndWalletInfo vndWalletInfo) =
      _VndWalletInfoLoaded;

  const factory WalletState.needToRegisterJA({required WalletType walletType}) =
      _NeedToRegisterJA;

  const factory WalletState.getDiamondWalletInfoLoading() =
      _GetDiamondWalletInfoLoading;

  const factory WalletState.getDiamondWalletInfoLoaded() =
      _GetDiamondWalletInfoLoaded;

  const factory WalletState.getCoinWalletInfoLoaded() =
      _GetCoinWalletInfoLoaded;

  const factory WalletState.getCoinWalletInfoLoading() =
      _GetCoinWalletInfoLoading;

  const factory WalletState.reloadVndWalletInfoSuccess() =
      _ReloadVndWalletInfoSuccess;

  const factory WalletState.reloadDiamondWalletInfoSuccess() =
      _ReloadDiamondWalletInfoSuccess;

  const factory WalletState.getWalletInfoSuccess({UserWallet? wallet}) =
      _GetWalletInfoSuccess;

  const factory WalletState.getWalletInfoLoading() = _GetWalletInfoLoading;
}
