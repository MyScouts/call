import 'package:freezed_annotation/freezed_annotation.dart';

part 'marshop_response.freezed.dart';
part 'marshop_response.g.dart';

@freezed
class ListMarshopResponse with _$ListMarshopResponse {
  const factory ListMarshopResponse({
    required int total,
    required List<MarshopResponse> marshops,
  }) = _ListMarshopResponse;

  factory ListMarshopResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMarshopResponseFromJson(json);
}

@freezed
class MarshopResponse with _$MarshopResponse {
  const factory MarshopResponse({
    required int id,
    String? name,
    required String code,
    required MarshopUserInfo user,
  }) = _MarshopResponse;

  factory MarshopResponse.fromJson(Map<String, dynamic> json) =>
      _$MarshopResponseFromJson(json);
}

@freezed
class MarshopUserInfo with _$MarshopUserInfo {
  const factory MarshopUserInfo({
    required int id,
    required String displayName,
    required String pDoneId,
    String? fullName,
    String? birthday,
  }) = _MarshopUserInfo;

  factory MarshopUserInfo.fromJson(Map<String, dynamic> json) =>
      _$MarshopUserInfoFromJson(json);
}

@freezed
class MarshopRegisterPacksResponse with _$MarshopRegisterPacksResponse {
  const factory MarshopRegisterPacksResponse({
    required List<MarshopRegisterPackResponse> packs,
  }) = _MarshopRegisterPacksResponse;

  factory MarshopRegisterPacksResponse.fromJson(Map<String, dynamic> json) =>
      _$MarshopRegisterPacksResponseFromJson(json);
}

@freezed
class MarshopRegisterPackResponse with _$MarshopRegisterPackResponse {
  const factory MarshopRegisterPackResponse({
    required int id,
    required int price,
    required String name,
    required List<MarshopRegisterPackRule> rules,
  }) = _MarshopRegisterPackResponse;

  factory MarshopRegisterPackResponse.fromJson(Map<String, dynamic> json) =>
      _$MarshopRegisterPackResponseFromJson(json);
}

@freezed
class MarshopRegisterPackRule with _$MarshopRegisterPackRule {
  const factory MarshopRegisterPackRule({
    required int quantity,
    required String title,
    required String content,
    required List<MarshopRegisterPackProduct> products,
  }) = _MarshopRegisterPackRule;

  factory MarshopRegisterPackRule.fromJson(Map<String, dynamic> json) =>
      _$MarshopRegisterPackRuleFromJson(json);
}

@freezed
class MarshopRegisterPackProduct with _$MarshopRegisterPackProduct {
  const factory MarshopRegisterPackProduct({
    required String id,
    @Default(0) int minQuantity,
    @Default(0) int maxQuantity,
  }) = _MarshopRegisterPackProduct;

  factory MarshopRegisterPackProduct.fromJson(Map<String, dynamic> json) =>
      _$MarshopRegisterPackProductFromJson(json);
}
