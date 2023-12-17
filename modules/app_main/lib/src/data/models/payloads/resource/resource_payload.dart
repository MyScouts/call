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
  }) = _BossGroupContractPram;

  factory BossGroupContractPram.fromJson(Map<String, dynamic> json) =>
      _$BossGroupContractPramFromJson(json);
}
