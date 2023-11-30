import 'package:app_core/app_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/data/datasources/models/est_coin_response.dart';
import 'package:wallet/data/datasources/models/request/buy_coin_request.dart';
import 'package:wallet/data/datasources/models/wallet_coin_payment_information_response.dart';

import '../../../../data/datasources/models/exchange_coin_response.dart';
import '../../../../data/datasources/models/request/agency_get_payment_information_request.dart';
import '../../../../domain/domain.dart';

part 'agency_bloc.freezed.dart';

part 'agency_event.dart';

part 'agency_state.dart';

class AgencyBloc extends Bloc<AgencyEvent, AgencyState> {
  final WalletPointUseCase _walletPointUseCase;

  AgencyBloc(this._walletPointUseCase) : super(const _Initial()) {
    on<_GetAllAgency>((event, emit) async {
      try {
        emit(const _GetAllAgencyLoading());
        final response = await _walletPointUseCase.getAllAgency();
        emit(_GetAllAgencyLoaded(response));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_GetAgencyInfo>((event, emit) async {
      try {
        emit(const _GetAgencyInfoLoading());
        final response =
            await _walletPointUseCase.getAgencyInfo(agencyId: event.id);
        emit(_GetAgencyInfoSuccess(agencyInfo: response.coinAgency));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_Exchange>((event, emit) async {
      try {
        emit(const _ExchangeLoading());
        final response = await _walletPointUseCase.exchangeCoin(
          agencyId: event.id,
          request: BuyCoinRequest(vnd: event.vnd, pDoneId: event.pDoneId, expectedCoin: event.coin)
        );
        emit(_ExchangeSuccess(response: response));
      } catch (e) {
        if (e is DioException) {
          emit(_Error(e.response?.data['code'] ?? ''));
        } else {
          const errMessage = 'Đã xảy ra lỗi';
          emit(const _Error(errMessage));
        }
      }
    });

    on<_EstCoinEvent>((event, emit) async {
      try {
        emit(const _ExchangeLoading());
        final response = await _walletPointUseCase.estCoin(
            agencyId: event.id, vnd: event.vnd, coin: event.coin);
        emit(_EstCoinSuccess(response: response));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_GetPaymentInformation>((event, emit) async {
      try {
        emit(const _ExchangeLoading());
        final response = await _walletPointUseCase.paymentInformation(
            agencyId: event.agencyId, request: event.request);
        emit(_GetPaymentInformationSuccess(response: response));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });
  }
}
