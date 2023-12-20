import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_payload.freezed.dart';
part 'resource_payload.g.dart';

@freezed
class RenderPDFPayload with _$RenderPDFPayload {
  const factory RenderPDFPayload({
    required int type,
    required dynamic params,
  }) = _RenderPDFPayload;

  factory RenderPDFPayload.fromJson(Map<String, dynamic> json) =>
      _$RenderPDFPayloadFromJson(json);
}

@freezed
class BossGroupContractPram with _$BossGroupContractPram {
  const factory BossGroupContractPram({
    required String contractNumber,
    required String date,
    required String month,
    required String year,
    required String fullName,
    required String birthday,
    required String identityNumber,
    required String issuer,
    required String issuedDate,
    required String address,
    required String phoneNumber,
    required String email,
    required String residentAddress,
  }) = _BossGroupContractPram;

  factory BossGroupContractPram.fromJson(Map<String, dynamic> json) =>
      _$BossGroupContractPramFromJson(json);
}

@freezed
class RentMarShopPackParam with _$RentMarShopPackParam {
  const factory RentMarShopPackParam({
    String? contractNumber,
    String? date,
    String? month,
    String? year,
    String? identityNumber,
    String? issuedDate,
    String? issuedPlace,
    String? address,
    String? phoneNumber,
    String? email,
    String? representative,
    String? position,
    String? rentCost,
    String? wordRentCost,
    String? depositAmount,
    String? wordDepositAmount,
    String? taxCode,
    String? residentAddress,
  }) = _RentMarShopPackParam;

  factory RentMarShopPackParam.fromJson(Map<String, dynamic> json) =>
      _$RentMarShopPackParamFromJson(json);
}

@freezed
class PurchaseMarShopPackParam with _$PurchaseMarShopPackParam {
  const factory PurchaseMarShopPackParam({
    String? contractNumber,
    String? date,
    String? month,
    String? year,
    String? address,
    String? taxCode,
    String? identityNumber,
    String? issuedDate,
    String? issuedPlace,
    String? phoneNumber,
    String? email,
    String? representative,
    String? position,
    String? price,
    String? wordPrice,
    String? residentAddress,
  }) = _PurchaseMarShopPackParam;

  factory PurchaseMarShopPackParam.fromJson(Map<String, dynamic> json) =>
      _$PurchaseMarShopPackParamFromJson(json);
}

@freezed
class JAContractParam with _$JAContractParam {
  const factory JAContractParam({
    required String contractNumber,
    required String date,
    required String month,
    required String year,
    required String fullName,
    required String fullname,
    required String birthday,
    required String identityNumber,
    required String issuer,
    required String issuedDate,
    required String residentAddress,
    required String address,
    required String phoneNumber,
    required String email,
  }) = _JAContractParam;

  factory JAContractParam.fromJson(Map<String, dynamic> json) =>
      _$JAContractParamFromJson(json);
}
