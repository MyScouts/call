import 'package:app_main/src/data/data_sources/remote/ecom_api.dart';
import 'package:app_main/src/data/models/responses/ecom/product_detail_response.dart';
import 'package:app_main/src/data/repositories/ecom_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EcomRepository)
class EcomRepositoryImpl extends EcomRepository {
  final EcomAPI _ecomAPI;

  EcomRepositoryImpl(this._ecomAPI);

  @override
  Future<ProductDetailResponse> productDetail(String productId) {
    return _ecomAPI.productDetail(productId);
  }
}
