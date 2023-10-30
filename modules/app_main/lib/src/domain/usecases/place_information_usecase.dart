import 'package:injectable/injectable.dart';

import '../entities/update_account/place/district.dart';
import '../entities/update_account/place/province.dart';
import '../entities/update_account/place/ward.dart';
import '../repository/place_information_repository.dart';


@injectable
class PlaceInformationUsecase {
  final PlaceInformationRepository _repository;

  PlaceInformationUsecase(this._repository);

  Future<List<Province>> provincesOfCountry(String iso2) async {
    return _repository.provincesOfCountry(iso2);
  }

  Future<List<District>> districtsByProvince(String iso2, int stateCode) async {
    return _repository.districtsByProvince(iso2, stateCode);
  }

  Future<List<Ward>> wardsByDistrict(
      String iso2, int stateCode, String district) async {
    return _repository.wardsByDistrict(iso2, stateCode, district);
  }
}
