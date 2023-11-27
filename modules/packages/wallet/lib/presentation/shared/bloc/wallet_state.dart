part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = _Initial;

  const factory WalletState.error(String err) = _Error;

  const factory WalletState.getWalletInfoSuccess({UserWallet? wallet}) =
      _GetWalletInfoSuccess;

  const factory WalletState.getWalletInfoLoading() = _GetWalletInfoLoading;

  const factory WalletState.getWalletTransactionListFailed(String err) =
      _GetWalletTransactionListFailed;

  const factory WalletState.getWalletTransactionListSuccess(
          {required List<TransactionItem> transactions}) =
      _GetWalletTransactionListSuccess;

  const factory WalletState.getWalletTransactionListLoading() =
      _GetWalletTransactionListLoading;

  const factory WalletState.getWalletTransactionDetailSuccess(
          {required TransactionItem transactions}) =
      _GetWalletTransactionDetailSuccess;

  const factory WalletState.getWalletTransactionDetailLoading() =
      _GetWalletTransactionDetailLoading;

  const factory WalletState.getWalletTransactionDetailFailed(String err) =
      _GetWalletTransactionDetailFailed;
}
