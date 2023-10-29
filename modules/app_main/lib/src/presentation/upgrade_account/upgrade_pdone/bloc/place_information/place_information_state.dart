part of 'place_information_bloc.dart';

@immutable
abstract class PlaceInformationState {
  final List<Country>? countries;
  final List<Province>? provinces;
  final List<District>? districts;
  final List<Ward>? wards;

  const PlaceInformationState(
    this.countries,
    this.provinces,
    this.districts,
    this.wards,
  );
}

class PlaceInformationInitial extends PlaceInformationState {
  const PlaceInformationInitial(List<Country> countries)
      : super(countries, null, null, null);
}

class GetListProvincesSuccess extends PlaceInformationState {
  const GetListProvincesSuccess(
    List<Country> countries,
    List<Province> provinces,
  ) : super(countries, provinces, null, null);
}

class GetDistrictsSuccess extends PlaceInformationState {
  const GetDistrictsSuccess(
    List<Country> countries,
    List<Province> provinces,
    List<District> districts,
  ) : super(countries, provinces, districts, null);
}

class GetWardsSuccess extends PlaceInformationState {
  const GetWardsSuccess(
    List<Country> countries,
    List<Province> provinces,
    List<District> districts,
    List<Ward> wards,
  ) : super(countries, provinces, districts, wards);
}
