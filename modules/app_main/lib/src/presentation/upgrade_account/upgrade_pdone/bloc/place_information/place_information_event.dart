part of 'place_information_bloc.dart';

@immutable
abstract class PlaceInformationEvent {}

@immutable
class UserClearCountryEvent extends PlaceInformationEvent {}

@immutable
class GetListProvincesEvent extends PlaceInformationEvent {
  final String iso2;

  GetListProvincesEvent(this.iso2);
}

@immutable
class GetDistrictsByProvinceEvent extends PlaceInformationEvent {
  final String iso2;
  final int stateCode;

  GetDistrictsByProvinceEvent(this.iso2, this.stateCode);
}

@immutable
class GetWardsByDistrictEvent extends PlaceInformationEvent {
  final String iso2;
  final int stateCode;
  final String district;

  GetWardsByDistrictEvent(this.iso2, this.stateCode, this.district);
}
