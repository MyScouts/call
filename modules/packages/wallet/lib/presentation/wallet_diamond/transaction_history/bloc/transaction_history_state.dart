part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryState {}

class TransactionHistoryStateInitial extends TransactionHistoryState {}

class TransactionHistoryStateLoading extends TransactionHistoryState {}

class TransactionHistoryStateError extends TransactionHistoryState {
  final String message;

  TransactionHistoryStateError(this.message);
}
