part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent {}

class GetTransactionHistoryEvent extends TransactionHistoryEvent {
  final DiamondTransactionHistoryFilter filter;
  final Pagination paginate;

  GetTransactionHistoryEvent({
    DiamondTransactionHistoryFilter? filter,
    this.paginate = const Pagination(),
  }) : filter = filter ?? DiamondTransactionHistoryFilter(date: DateTime.now());
}
