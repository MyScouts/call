import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/domain.dart';
import '../../../../domain/entities/agency/agency_info.dart';

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
        emit(_GetAgencyInfoSuccess(agencyInfo: response));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });

    on<_Exchange>((event, emit) async {
      try {
        emit(const _ExchangeLoading());
        final response = await _walletPointUseCase.exchangeCoin(
          agencyId: event.agencyId,
          value: event.value,
        );
        emit(_ExchangeSuccess(valueExchanged: response));
      } catch (e) {
        const errMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errMessage));
      }
    });
  }
}
