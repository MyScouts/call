part of 'agency_bloc.dart';

@freezed
class AgencyState with _$AgencyState {
  const factory AgencyState.initial() = _Initial;

  const factory AgencyState.error(String err) = _Error;

  const factory AgencyState.getAgencyInfoSuccess(
      {required AgencyResponse agencyInfo}) = _GetAgencyInfoSuccess;

  const factory AgencyState.getAgencyInfoLoading() = _GetAgencyInfoLoading;

  const factory AgencyState.exchangeLoading() = _ExchangeLoading;

  const factory AgencyState.exchangeSuccess({required ExchangeCoinResponse response}) =
      _ExchangeSuccess;

  const factory AgencyState.getAllAgencyLoading() = _GetAllAgencyLoading;

  const factory AgencyState.getAllAgencyLoaded(List<AgencyResponse> agency) =
      _GetAllAgencyLoaded;

  const factory AgencyState.estCoin({required EstCoinResponse response}) =
      _EstCoinSuccess;

  const factory AgencyState.paymentInformation({required WalletCoinPaymentInformation response}) =
  _GetPaymentInformationSuccess;
}
