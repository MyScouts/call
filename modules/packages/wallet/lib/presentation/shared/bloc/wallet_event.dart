part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.getWalletInfo() = _GetWalletInfoEvent;

  const factory WalletEvent.getWalletTransactionList(
      {required WalletType walletType}) = _GetWalletTransactionListEvent;

  const factory WalletEvent.getWalletTransactionDetail({required String id}) =
      _GetWalletTransactionDetailEvent;
}
