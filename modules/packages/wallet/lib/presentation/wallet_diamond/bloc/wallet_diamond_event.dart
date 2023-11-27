part of 'wallet_diamond_bloc.dart';

abstract class WalletDiamondEvent extends Equatable {}

class NavigateToTransactionHistoryScreen extends WalletDiamondEvent {
  @override
  List<Object?> get props => [];
}

class LoadWalletDiamondInfo extends WalletDiamondEvent {
  @override
  List<Object?> get props => [];
}

class UpdateExchangeDiamondVND extends WalletDiamondEvent {
  final int exchangeDiamondVND;

  UpdateExchangeDiamondVND(this.exchangeDiamondVND);

  @override
  List<Object?> get props => [exchangeDiamondVND];
}

class SetExchangeDiamondVND extends WalletDiamondEvent {
  final int exchangeDiamondVND;

  SetExchangeDiamondVND(this.exchangeDiamondVND);

  @override
  List<Object?> get props => [exchangeDiamondVND];
}

class ExchangeDiamond extends WalletDiamondEvent {
  final int exchangeDiamondVND;

  ExchangeDiamond(this.exchangeDiamondVND);

  @override
  List<Object?> get props => [exchangeDiamondVND];
}
