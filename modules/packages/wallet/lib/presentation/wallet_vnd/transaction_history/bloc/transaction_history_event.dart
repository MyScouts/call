part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent {}

class GetTransactionHistoryEvent extends TransactionHistoryEvent {
  final TransactionHistoryFilter filter;
  final Pagination paginate;

  GetTransactionHistoryEvent({
    TransactionHistoryFilter? filter,
    this.paginate = const Pagination(),
  }) : filter = filter ?? TransactionHistoryFilter(date: DateTime.now());
}
