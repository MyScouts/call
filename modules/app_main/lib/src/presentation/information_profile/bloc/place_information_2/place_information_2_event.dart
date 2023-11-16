part of 'place_information_2_bloc.dart';

@immutable
abstract class PlaceInformationEvent2 {}

@immutable
class UserClearCountryEvent2 extends PlaceInformationEvent2 {}

@immutable
class GetListProvincesEvent2 extends PlaceInformationEvent2 {
  final String iso2;

  GetListProvincesEvent2(this.iso2);
}

@immutable
class GetDistrictsByProvinceEvent2 extends PlaceInformationEvent2 {
  final String iso2;
  final dynamic stateCode;

  GetDistrictsByProvinceEvent2(this.iso2, this.stateCode);
}

@immutable
class GetWardsByDistrictEvent2 extends PlaceInformationEvent2 {
  final String iso2;
  final dynamic stateCode;
  final String district;

  GetWardsByDistrictEvent2(this.iso2, this.stateCode, this.district);
}
