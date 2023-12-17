import 'package:app_main/src/data/models/responses/ecom/product_detail_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'ecom_api.g.dart';

class EcomAPIConstants {
  static const String productDetail =
      'api/v1/marshop/register-pack-products/{productId}';
}

@RestApi()
@injectable
abstract class EcomAPI {
  @factoryMethod
  factory EcomAPI(Dio dio) = _EcomAPI;

  @GET(EcomAPIConstants.productDetail)
  Future<ProductDetailResponse> productDetail(
    @Path("productId") String productId,
  );
}
