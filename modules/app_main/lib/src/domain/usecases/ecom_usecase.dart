import 'package:app_main/src/data/models/responses/ecom/product_detail_response.dart';
import 'package:app_main/src/data/repositories/ecom_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EcomUsecase {
  final EcomRepository _ecomRepository;

  EcomUsecase(
    this._ecomRepository,
  );

  Future<ProductDetailResponse> productDetail(String productId) {
    return _ecomRepository.productDetail(productId);
  }

  Future<List<ProductDetailResponse>> getProducts(
    List<String> productIds,
  ) async {
    List<ProductDetailResponse> products = [];
    for (var index = 0; index < productIds.length; index++) {
      final response = await _ecomRepository.productDetail(productIds[index]);
      products.add(response);
    }
    return products;
  }
}
