import 'package:app_main/src/domain/entities/update_account/place/country.dart';

import '../entities/update_account/place/district.dart';
import '../entities/update_account/place/province.dart';
import '../entities/update_account/place/ward.dart';

abstract class PlaceInformationRepository {
  Future<List<Country>> countries();

  Future<List<Province>> provincesOfCountry(String iso2);

  Future<List<District>> districtsByProvince(String iso2, int stateCode);

  Future<List<Ward>> wardsByDistrict(
      String iso2, int stateCode, String districtId);
}
