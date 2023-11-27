part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent {}

class GetTransactionHistoryEvent extends TransactionHistoryEvent {
  final PointTransactionHistoryFilter filter;
  final Pagination paginate;

  GetTransactionHistoryEvent({
    PointTransactionHistoryFilter? filter,
    this.paginate = const Pagination(),
  }) : filter = filter ?? const PointTransactionHistoryFilter();
}
