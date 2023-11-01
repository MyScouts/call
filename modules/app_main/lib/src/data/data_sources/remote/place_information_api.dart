import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/networking/api_response.dart';
import '../../../domain/entities/update_account/place/district.dart';
import '../../../domain/entities/update_account/place/province.dart';
import '../../../domain/entities/update_account/place/ward.dart';
import 'place_information_provider.dart';

part 'place_information_api.g.dart';

class PlaceInformationAPIConstants {
  static const provincesOfCountry = 'api/master/countries/{iso2}/provinces';
  static const districtsByProvinces =
      'api/master/countries/{iso2}/{stateCode}/districts';
  static const ward =
      'api/master/countries/{iso2}/{stateCode}/{districts}/wards';
}

@RestApi()
@injectable
abstract class PlaceInformationAPI {
  @factoryMethod
  factory PlaceInformationAPI(Dio dio) =>
      _PlaceInformationAPI(dio);

  @GET(PlaceInformationAPIConstants.provincesOfCountry)
  Future<ApiResponse<List<Province>>> provincesOfCountry({
    @Path('iso2') required String iso2,
  });

  @GET(PlaceInformationAPIConstants.districtsByProvinces)
  Future<ApiResponse<List<District>>> districtsByProvinces({
    @Path('iso2') required String iso2,
    @Path('stateCode') required int stateCode,
  });

  @GET(PlaceInformationAPIConstants.ward)
  Future<ApiResponse<List<Ward>>> ward({
    @Path('iso2') required String iso2,
    @Path('stateCode') required int stateCode,
    @Path('districts') required String districtId,
  });
}
