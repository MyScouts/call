// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RenderPDFPayloadImpl _$$RenderPDFPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$RenderPDFPayloadImpl(
      type: json['type'] as int,
      params: json['params'],
    );

Map<String, dynamic> _$$RenderPDFPayloadImplToJson(
        _$RenderPDFPayloadImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'params': instance.params,
    };

_$BossGroupContractPramImpl _$$BossGroupContractPramImplFromJson(
        Map<String, dynamic> json) =>
    _$BossGroupContractPramImpl(
      date: json['date'] as String,
      month: json['month'] as String,
      year: json['year'] as String,
      fullName: json['fullName'] as String,
      birthday: json['birthday'] as String,
      identityNumber: json['identityNumber'] as String,
      issuer: json['issuer'] as String,
      issuedDate: json['issuedDate'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$BossGroupContractPramImplToJson(
        _$BossGroupContractPramImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'month': instance.month,
      'year': instance.year,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'identityNumber': instance.identityNumber,
      'issuer': instance.issuer,
      'issuedDate': instance.issuedDate,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };

_$RentMarShopPackParamImpl _$$RentMarShopPackParamImplFromJson(
        Map<String, dynamic> json) =>
    _$RentMarShopPackParamImpl(
      date: json['date'] as String?,
      month: json['month'] as String?,
      year: json['year'] as String?,
      identityNumber: json['identityNumber'] as String?,
      issuedDate: json['issuedDate'] as String?,
      issuedPlace: json['issuedPlace'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      representative: json['representative'] as String?,
      position: json['position'] as String?,
      rentCost: json['rentCost'] as String?,
      wordRentCost: json['wordRentCost'] as String?,
      depositAmount: json['depositAmount'] as String?,
      wordDepositAmount: json['wordDepositAmount'] as String?,
      taxCode: json['taxCode'] as String?,
    );

Map<String, dynamic> _$$RentMarShopPackParamImplToJson(
        _$RentMarShopPackParamImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'month': instance.month,
      'year': instance.year,
      'identityNumber': instance.identityNumber,
      'issuedDate': instance.issuedDate,
      'issuedPlace': instance.issuedPlace,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'representative': instance.representative,
      'position': instance.position,
      'rentCost': instance.rentCost,
      'wordRentCost': instance.wordRentCost,
      'depositAmount': instance.depositAmount,
      'wordDepositAmount': instance.wordDepositAmount,
      'taxCode': instance.taxCode,
    };

_$PurchaseMarShopPackParamImpl _$$PurchaseMarShopPackParamImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseMarShopPackParamImpl(
      date: json['date'] as String?,
      month: json['month'] as String?,
      year: json['year'] as String?,
      address: json['address'] as String?,
      taxCode: json['taxCode'] as String?,
      identityNumber: json['identityNumber'] as String?,
      issuedDate: json['issuedDate'] as String?,
      issuedPlace: json['issuedPlace'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      representative: json['representative'] as String?,
      position: json['position'] as String?,
      price: json['price'] as String?,
      wordPrice: json['wordPrice'] as String?,
    );

Map<String, dynamic> _$$PurchaseMarShopPackParamImplToJson(
        _$PurchaseMarShopPackParamImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'month': instance.month,
      'year': instance.year,
      'address': instance.address,
      'taxCode': instance.taxCode,
      'identityNumber': instance.identityNumber,
      'issuedDate': instance.issuedDate,
      'issuedPlace': instance.issuedPlace,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'representative': instance.representative,
      'position': instance.position,
      'price': instance.price,
      'wordPrice': instance.wordPrice,
    };
