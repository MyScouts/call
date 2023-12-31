import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_response.freezed.dart';
part 'product_detail_response.g.dart';

@freezed
class ProductDetailResponse with _$ProductDetailResponse {
  const factory ProductDetailResponse({
    required int id,
    required String name,
    required String avatar,
    String? description,
    required int price,
  }) = _ProductDetailResponse;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseFromJson(json);
}
