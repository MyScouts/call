import 'package:app_main/src/domain/entities/update_account/place/country.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/update_account/place/district.dart';
import '../../../domain/entities/update_account/place/province.dart';
import '../../../domain/entities/update_account/place/ward.dart';
import '../../../domain/repository/place_information_repository.dart';
import '../../data_sources/remote/place_information_api.dart';

@Injectable(as: PlaceInformationRepository)
class PlaceInformationRepositoryImpl extends PlaceInformationRepository {
  final PlaceInformationAPI _placeInformationApi;

  PlaceInformationRepositoryImpl(this._placeInformationApi);

  @override
  Future<List<Province>> provincesOfCountry(String iso2) async {
    final res = await _placeInformationApi.provincesOfCountry(iso2: iso2);

    return res.data;
  }

  @override
  Future<List<District>> districtsByProvince(String iso2, int stateCode) async {
    final res = await _placeInformationApi.districtsByProvinces(iso2: iso2, stateCode: stateCode);

    return res.data;
  }

  @override
  Future<List<Ward>> wardsByDistrict(String iso2, int stateCode, String districtId) async {
    final res = await _placeInformationApi.ward(iso2: iso2, stateCode: stateCode, districtId: districtId);

    return res.data;
  }

  @override
  Future<List<Country>> countries() async {
    final res = await _placeInformationApi.countries();
    return res.data;
  }
}
