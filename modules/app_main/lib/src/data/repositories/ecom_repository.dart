import 'package:app_main/src/data/models/responses/ecom/product_detail_response.dart';

abstract class EcomRepository {
  Future<ProductDetailResponse> productDetail(String productId);
}
