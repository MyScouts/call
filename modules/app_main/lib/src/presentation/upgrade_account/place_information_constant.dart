import '../../domain/entities/update_account/place/country.dart';

enum PlaceInformationType {
  country,
  province,
  district,
  ward,
}

List<Country> countries = [
  const Country(name: 'Vietnam', iso2: 'vn'),
];
