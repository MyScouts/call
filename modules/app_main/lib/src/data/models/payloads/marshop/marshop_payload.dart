import 'package:json_annotation/json_annotation.dart';

part 'marshop_payload.g.dart';

@JsonSerializable()
class RegisterCustomerPayload {
  final String otp;
  final int marshopId;

  const RegisterCustomerPayload({
    required this.marshopId,
    required this.otp,
  });

  factory RegisterCustomerPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterCustomerPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCustomerPayloadToJson(this);
}

@JsonSerializable()
class RegisterMarshopPayload {
  final int packId;
  final int referralId;
  final RegisterMarshopBillInfo billInfo;

  RegisterMarshopPayload({
    required this.packId,
    required this.referralId,
    required this.billInfo,
  });

  factory RegisterMarshopPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterMarshopPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMarshopPayloadToJson(this);
}

@JsonSerializable()
class RegisterMarshopBillInfo {
  final List<RegisterMarshopProduct> productInfo;
  final RegisterMarshopPrice priceInfo;
  final RegisterMarshopAddress addressInfo;

  RegisterMarshopBillInfo({
    required this.productInfo,
    required this.priceInfo,
    required this.addressInfo,
  });

  factory RegisterMarshopBillInfo.fromJson(Map<String, dynamic> json) =>
      _$RegisterMarshopBillInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMarshopBillInfoToJson(this);
}

@JsonSerializable()
class RegisterMarshopProduct {
  final int productId;
  final int quantity;

  RegisterMarshopProduct({
    required this.productId,
    required this.quantity,
  });

  factory RegisterMarshopProduct.fromJson(Map<String, dynamic> json) =>
      _$RegisterMarshopProductFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMarshopProductToJson(this);
}

@JsonSerializable()
class RegisterMarshopPrice {
  final int price;
  final int tax;
  final int shipFee;

  RegisterMarshopPrice({
    required this.price,
    required this.tax,
    required this.shipFee,
  });

  factory RegisterMarshopPrice.fromJson(Map<String, dynamic> json) =>
      _$RegisterMarshopPriceFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMarshopPriceToJson(this);
}

@JsonSerializable()
class RegisterMarshopAddress {
  final String countryName;
  final String provinceName;
  final String districtName;
  final String wardName;
  final String address;

  RegisterMarshopAddress({
    required this.countryName,
    required this.provinceName,
    required this.districtName,
    required this.wardName,
    required this.address,
  });

  factory RegisterMarshopAddress.fromJson(Map<String, dynamic> json) =>
      _$RegisterMarshopAddressFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMarshopAddressToJson(this);
}

@JsonSerializable()
class GetListMarshopPayload {
  final int page;
  final int pageSize;

  GetListMarshopPayload({
    required this.page,
    required this.pageSize,
  });

  factory GetListMarshopPayload.fromJson(Map<String, dynamic> json) =>
      _$GetListMarshopPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$GetListMarshopPayloadToJson(this);
}

@JsonSerializable()
class GetMarshopInfoPayload {
  @JsonKey(includeIfNull: false)
  int? userId;
  @JsonKey(includeIfNull: false)
  String? pdoneId;
  @JsonKey(includeIfNull: false)
  int? marshopId;

  GetMarshopInfoPayload({
    this.userId,
    this.pdoneId,
    this.marshopId,
  });

  factory GetMarshopInfoPayload.fromJson(Map<String, dynamic> json) =>
      _$GetMarshopInfoPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$GetMarshopInfoPayloadToJson(this);
}
