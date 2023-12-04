part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.getWalletInfo() = _GetWalletInfoEvent;

  const factory WalletEvent.getWalletTransactionList({
    required WalletType walletType,
    WalletTransactionsRequest? request,
  }) = _GetWalletTransactionListEvent;

  const factory WalletEvent.getWalletTransactionDetail({required String id}) =
      _GetWalletTransactionDetailEvent;

  const factory WalletEvent.filterTransaction({required FilterOption filter}) =
      _FilterTransactionEvent;
}
