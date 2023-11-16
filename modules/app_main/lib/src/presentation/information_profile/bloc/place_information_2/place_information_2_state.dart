part of 'place_information_2_bloc.dart';

@immutable
abstract class PlaceInformationState2 {
  final List<Country>? countries;
  final List<Province>? provinces;
  final List<District>? districts;
  final List<Ward>? wards;

  const PlaceInformationState2(
    this.countries,
    this.provinces,
    this.districts,
    this.wards,
  );
}

class PlaceInformationInitial2 extends PlaceInformationState2 {
  const PlaceInformationInitial2(List<Country> countries) : super(countries, null, null, null);
}

class GetListProvincesSuccess2 extends PlaceInformationState2 {
  const GetListProvincesSuccess2(
    List<Country> countries,
    List<Province> provinces,
  ) : super(countries, provinces, null, null);
}

class GetDistrictsSuccess2 extends PlaceInformationState2 {
  const GetDistrictsSuccess2(
    List<Country> countries,
    List<Province> provinces,
    List<District> districts,
  ) : super(countries, provinces, districts, null);
}

class GetWardsSuccess2 extends PlaceInformationState2 {
  const GetWardsSuccess2(
    List<Country> super.countries,
    List<Province> super.provinces,
    List<District> super.districts,
    List<Ward> super.wards,
  );
}
