part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryState {}

class TransactionHistoryStateInitial extends TransactionHistoryState {}

class TransactionHistoryStateLoading extends TransactionHistoryState {}

class TransactionHistoryLoaded extends TransactionHistoryState {
  final List<TransactionHistory> transactionHistories;

  TransactionHistoryLoaded(this.transactionHistories);
}
