// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marshop_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCustomerPayload _$RegisterCustomerPayloadFromJson(
        Map<String, dynamic> json) =>
    RegisterCustomerPayload(
      marshopId: json['marshopId'] as int,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$RegisterCustomerPayloadToJson(
        RegisterCustomerPayload instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'marshopId': instance.marshopId,
    };

RegisterMarshopPayload _$RegisterMarshopPayloadFromJson(
        Map<String, dynamic> json) =>
    RegisterMarshopPayload(
      packId: json['packId'] as int,
      referralId: json['referralId'] as int,
      billInfo: RegisterMarshopBillInfo.fromJson(
          json['billInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterMarshopPayloadToJson(
        RegisterMarshopPayload instance) =>
    <String, dynamic>{
      'packId': instance.packId,
      'referralId': instance.referralId,
      'billInfo': instance.billInfo,
    };

RegisterMarshopBillInfo _$RegisterMarshopBillInfoFromJson(
        Map<String, dynamic> json) =>
    RegisterMarshopBillInfo(
      productInfo: (json['productInfo'] as List<dynamic>)
          .map(
              (e) => RegisterMarshopProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      priceInfo: RegisterMarshopPrice.fromJson(
          json['priceInfo'] as Map<String, dynamic>),
      addressInfo: RegisterMarshopAddress.fromJson(
          json['addressInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterMarshopBillInfoToJson(
        RegisterMarshopBillInfo instance) =>
    <String, dynamic>{
      'productInfo': instance.productInfo,
      'priceInfo': instance.priceInfo,
      'addressInfo': instance.addressInfo,
    };

RegisterMarshopProduct _$RegisterMarshopProductFromJson(
        Map<String, dynamic> json) =>
    RegisterMarshopProduct(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$RegisterMarshopProductToJson(
        RegisterMarshopProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };

RegisterMarshopPrice _$RegisterMarshopPriceFromJson(
        Map<String, dynamic> json) =>
    RegisterMarshopPrice(
      price: json['price'] as int,
      tax: json['tax'] as int,
      shipFee: json['shipFee'] as int,
    );

Map<String, dynamic> _$RegisterMarshopPriceToJson(
        RegisterMarshopPrice instance) =>
    <String, dynamic>{
      'price': instance.price,
      'tax': instance.tax,
      'shipFee': instance.shipFee,
    };

RegisterMarshopAddress _$RegisterMarshopAddressFromJson(
        Map<String, dynamic> json) =>
    RegisterMarshopAddress(
      countryName: json['countryName'] as String,
      provinceName: json['provinceName'] as String,
      districtName: json['districtName'] as String,
      wardName: json['wardName'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$RegisterMarshopAddressToJson(
        RegisterMarshopAddress instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'provinceName': instance.provinceName,
      'districtName': instance.districtName,
      'wardName': instance.wardName,
      'address': instance.address,
    };

GetListMarshopPayload _$GetListMarshopPayloadFromJson(
        Map<String, dynamic> json) =>
    GetListMarshopPayload(
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
    );

Map<String, dynamic> _$GetListMarshopPayloadToJson(
        GetListMarshopPayload instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
    };

GetMarshopInfoPayload _$GetMarshopInfoPayloadFromJson(
        Map<String, dynamic> json) =>
    GetMarshopInfoPayload(
      userId: json['userId'] as int?,
      pdoneId: json['pdoneId'] as String?,
      marshopId: json['marshopId'] as int?,
    );

Map<String, dynamic> _$GetMarshopInfoPayloadToJson(
    GetMarshopInfoPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('pdoneId', instance.pdoneId);
  writeNotNull('marshopId', instance.marshopId);
  return val;
}
