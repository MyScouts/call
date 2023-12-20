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
          {required TransactionItem transaction}) =
      _GetWalletTransactionDetailSuccess;

  const factory WalletState.getWalletTransactionDetailLoading() =
      _GetWalletTransactionDetailLoading;

  const factory WalletState.getWalletTransactionDetailFailed(String err) =
      _GetWalletTransactionDetailFailed;

  const factory WalletState.getPDoneProfileLoading() = _GetPDoneProfileLoading;

  const factory WalletState.getPDoneProfileSuccess(PDoneProfile pDoneProfile) =
      _GetPDoneProfileSuccess;

  const factory WalletState.getPDoneProfileFailed(String err) =
      _GetPDoneProfileFailed;

  const factory WalletState.getOnboardingLoading() = _GetOnboardingLoading;

  const factory WalletState.getOnboardingSuccess(
      OnboardingResponse onboarding) = _GetOnboardingSuccess;

  const factory WalletState.getOnboardingFail(String err) = _GetOnboardingFail;

  const factory WalletState.filterTransactionSuccess(
          {required List<TransactionItem> transactions}) =
      _FilterTransactionSuccess;
}
