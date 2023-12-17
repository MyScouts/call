import 'dart:convert';

import 'package:app_core/app_core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet/core/configuratons/configurations.dart';
import 'package:wallet/data/datasources/models/response/transactions_response.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';
import 'package:wallet/presentation/shared/widgets/transaction_filter_sheet.dart';

import '../../../data/datasources/models/request/wallet_transactions_request.dart';
import '../../../data/datasources/models/response/onboarding_response.dart';
import '../../../domain/entities/wallet/vnd_wallet_info/vnd_wallet_info.dart';
import '../../../domain/repository/wallet_repository.dart';
import '../../wallet_constant.dart';
import '../model/infomation_pdone_profile.dart';

part 'wallet_bloc.freezed.dart';

part 'wallet_event.dart';

part 'wallet_state.dart';

@singleton
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository _walletRepository;
  final SharedPreferences _shared;
  late VndWalletInfo vndWalletInfo = const VndWalletInfo();

  WalletBloc(this._walletRepository, this._shared) : super(const _Initial()) {
    List<TransactionItem> transactions = [];

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
        final transactionList =
            await _walletRepository.getWalletTransactionList(
          walletType: event.walletType,
          request: event.request,
        );
        transactions = transactionList;
        emit(_GetWalletTransactionListSuccess(transactions: transactionList));
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
        final transactionList = transactions.where((transaction) {
          final transactionResolvedStatus = TransactionResolvedStatus.values
              .firstWhere(
                  (status) => status.name == transaction.resolvedStatus);
          final transactionType = TransactionType.values
              .firstWhere((type) => type.value == transaction.transactionType);
          if (event.filter.status.isEmpty) {
            return event.filter.type.contains(transactionType);
          } else if (event.filter.type.isEmpty) {
            return event.filter.status.contains(transactionResolvedStatus);
          }
          return event.filter.status.contains(transactionResolvedStatus) &&
              event.filter.type.contains(transactionType);
        }).toList();
        emit(_GetWalletTransactionListSuccess(transactions: transactionList));
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
