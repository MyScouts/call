import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../domain/domain.dart';

part 'transaction_history_event.dart';

part 'transaction_history_state.dart';

class TransactionHistoryData {
  TransactionHistoryFilter _filter = const TransactionHistoryFilter();

  TransactionHistoryFilter get filter => _filter;

  set setFilter(TransactionHistoryFilter filter) => _filter = filter;

  Pagination _paginate = const Pagination();

  Pagination get paginate => _paginate;

  set setPaginate(Pagination pagination) => _paginate = pagination;
}

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  final TransactionHistoryVendor vendor;

  final WalletVndUseCase _walletVndUseCase;

  final dataState = TransactionHistoryData();

  final refreshController = RefreshController();

  TransactionHistoryBloc(this.vendor, this._walletVndUseCase)
      : super(TransactionHistoryStateInitial()) {
    on<GetTransactionHistoryEvent>(_onGetTransactionHistoryEvent);
  }

  Future<void> _onGetTransactionHistoryEvent(
    GetTransactionHistoryEvent event,
    Emitter<TransactionHistoryState> emit,
  ) async {
    emit(TransactionHistoryStateLoading());
    final filter = event.filter;
    final paginate = event.paginate;

    final data = await _walletVndUseCase.getTransactionHistories(
      vendor.code,
      filter,
      paginate,
    );

    dataState.setFilter = event.filter;
    dataState.setPaginate = event.paginate;

    emit(TransactionHistoryLoaded(data));
  }

  void onRefresh() {
    dataState.setPaginate = const Pagination();
    add(GetTransactionHistoryEvent(
      filter: dataState.filter,
      paginate: dataState.paginate,
    ));

    refreshController.refreshCompleted();
  }

  void onLoading() {
    final newPaginate = dataState.paginate.copyWith(
      pageSize: dataState.paginate.pageSize + 10,
    );
    add(GetTransactionHistoryEvent(
      filter: dataState.filter,
      paginate: newPaginate,
    ));

    dataState.setPaginate = newPaginate;

    refreshController.loadComplete();
  }
}
