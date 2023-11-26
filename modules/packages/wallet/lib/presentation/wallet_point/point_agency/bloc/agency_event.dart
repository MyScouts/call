part of 'agency_bloc.dart';

@freezed
class AgencyEvent with _$AgencyEvent {
  const factory AgencyEvent.getAllAgency() = _GetAllAgency;

  const factory AgencyEvent.getAgencyInfo(int id) = _GetAgencyInfo;
  const factory AgencyEvent.est(int id, num vnd, num coin) = _EstCoinEvent;

  const factory AgencyEvent.exchange(
      {required int agencyId, required num value}) = _Exchange;
}
