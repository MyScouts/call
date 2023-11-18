part of 'wallet_diamond_bloc.dart';

abstract class WalletDiamondState {}

class WalletDiamondInitial extends WalletDiamondState {}

class WalletDiamondNavigateToTransactionHistoryScreen
    extends WalletDiamondState {}

class WalletDiamondLoaded extends WalletDiamondState {
  final DiamondWalletInfo walletDiamondInfo;

  WalletDiamondLoaded(this.walletDiamondInfo);
}

class ExchangeVNDValueUpdated extends WalletDiamondState {
  final int exchangeDiamondVND;

  ExchangeVNDValueUpdated(this.exchangeDiamondVND);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ExchangeVNDValueUpdated &&
        other.exchangeDiamondVND == exchangeDiamondVND;
  }

  @override
  int get hashCode => exchangeDiamondVND.hashCode;
}

class ExchangeDiamondSuccess extends WalletDiamondState {}

class ExchangeDiamondFailure extends WalletDiamondState {}

class WalletDiamondError extends WalletDiamondState {
  final String error;

  WalletDiamondError(this.error);
}
