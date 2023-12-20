import 'package:app_core/app_core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/core/configuratons/configurations.dart';
import 'package:wallet/data/datasources/models/response/transactions_response.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';
import 'package:wallet/presentation/shared/widgets/transaction_filter_sheet.dart';

import '../../../data/datasources/models/request/wallet_transactions_request.dart';
import '../../../data/datasources/models/response/onboarding_response.dart';
import '../../../domain/entities/wallet/vnd_wallet_info/vnd_wallet_info.dart';
import '../../../domain/repository/wallet_repository.dart';
import '../../../domain/specs/pagination/pagination.dart';
import '../../wallet_constant.dart';
import '../model/infomation_pdone_profile.dart';

part 'wallet_bloc.freezed.dart';

part 'wallet_event.dart';

part 'wallet_state.dart';

class TransactionHistoryData {
  FilterOption _filter = FilterOption(status: [], type: []);

  FilterOption get filter => _filter;

  set setFilter(FilterOption filter) => _filter = filter;

  WalletTransactionsRequest _request = WalletTransactionsRequest();

  WalletTransactionsRequest get request => _request;

  set setRequest(WalletTransactionsRequest request) => _request = request;

  WalletType currentWalletType = WalletType.vnd;

  set setWalletType(WalletType walletType) => currentWalletType = walletType;
}

@singleton
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository _walletRepository;
  final SharedPreferences _shared;
  late VndWalletInfo vndWalletInfo = const VndWalletInfo();

  final dataState = TransactionHistoryData();
  final refreshController = RefreshController();
  List<TransactionItem> transactions = [];

  void onRefresh() {
    dataState.setRequest = WalletTransactionsRequest(
      pageSize: 10,
      page: 1,
      fromTimestamp: dataState.request.fromTimestamp,
      toTimestamp: dataState.request.toTimestamp,
      transactionType: dataState.request.transactionType,
    );
    transactions = [];
    add(
      WalletEvent.getWalletTransactionList(
        walletType: dataState.currentWalletType,
        request: dataState.request,
      ),
    );

    refreshController.refreshCompleted();
  }

  void onLoading() {
    final request = WalletTransactionsRequest(
      page: dataState.request.page! + 1,
      pageSize: dataState.request.pageSize,
      fromTimestamp: dataState.request.fromTimestamp,
      toTimestamp: dataState.request.toTimestamp,
      transactionType: dataState.request.transactionType,
    );

    add(
      WalletEvent.getWalletTransactionList(
        walletType: dataState.currentWalletType,
        request: request,
      ),
    );

    dataState.setRequest = request;

    refreshController.loadComplete();
  }

  WalletBloc(this._walletRepository, this._shared) : super(const _Initial()) {
    on<_GetWalletInfoEvent>((event, emit) async {
      try {
        emit(const _GetWalletInfoLoading());
        final wallet = await _walletRepository.getWalletInfo();
        if (wallet != null) {
          WalletInjectedData.setUserWallet = wallet;
        }
        emit(_GetWalletInfoSuccess(wallet: wallet));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errorMessage));
      } catch (e) {
        debugPrint(e.toString());
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errorMessage));
      }
    });

    on<_GetWalletTransactionListEvent>((event, emit) async {
      try {
        emit(const _GetWalletTransactionListLoading());

        final cloneList = await _walletRepository.getWalletTransactionList(
          walletType: event.walletType,
          request: event.request,
        );
        dataState.setWalletType = event.walletType;
        dataState.setRequest = event.request;

        transactions += cloneList;
        emit(_GetWalletTransactionListSuccess(transactions: transactions));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetWalletTransactionListFailed(errorMessage));
      } catch (e) {
        debugPrint(e.toString());
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetWalletTransactionListFailed(errorMessage));
      }
    });

    on<_FilterTransactionEvent>((event, emit) async {
      try {
        emit(const _GetWalletTransactionListLoading());

        List<TransactionItem> transactionList = transactions;
        if (event.filter.status.isNotEmpty || event.filter.type.isNotEmpty) {
          transactionList = transactions.where((transaction) {
            final transactionResolvedStatus = TransactionResolvedStatus.values
                .firstWhere(
                    (status) => status.name == transaction.resolvedStatus);
            final transactionType = TransactionType.values.firstWhere(
                (type) => type.value == transaction.transactionType);
            if (event.filter.status.isEmpty) {
              return event.filter.type.contains(transactionType);
            } else if (event.filter.type.isEmpty) {
              return event.filter.status.contains(transactionResolvedStatus);
            }
            return event.filter.status.contains(transactionResolvedStatus) &&
                event.filter.type.contains(transactionType);
          }).toList();
        }
        dataState.setFilter = event.filter;
        emit(_FilterTransactionSuccess(transactions: transactionList));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetWalletTransactionListFailed(errorMessage));
      } catch (e) {
        debugPrint(e.toString());
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetWalletTransactionListFailed(errorMessage));
      }
    });

    on<_GetWalletTransactionDetailEvent>((event, emit) async {
      try {
        emit(const _GetWalletTransactionDetailLoading());
        final transaction =
            await _walletRepository.getTransactionDetails(event.id);
        emit(_GetWalletTransactionDetailSuccess(transaction: transaction));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetWalletTransactionDetailFailed(errorMessage));
      } catch (e) {
        debugPrint(e.toString());
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetWalletTransactionDetailFailed(errorMessage));
      }
    });

    on<_GetPDoneProfileEvent>((event, emit) async {
      try {
        emit(const _GetPDoneProfileLoading());
        final pdoneProfile = await _walletRepository.getPDoneProfile();
        emit(_GetPDoneProfileSuccess(pdoneProfile));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetPDoneProfileFailed(errorMessage));
      } catch (e) {
        debugPrint(e.toString());
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetPDoneProfileFailed(errorMessage));
      }
    });

    on<_GetOnboardingEvent>((event, emit) async {
      try {
        emit(const _GetOnboardingLoading());
        final onboardingData = await _walletRepository.getOnboarding();
        emit(_GetOnboardingSuccess(onboardingData));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetOnboardingFail(errorMessage));
      } catch (e) {
        debugPrint(e.toString());
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _GetOnboardingFail(errorMessage));
      }
    });
  }
}
