import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_pdone_birth_place_payload.freezed.dart';
part 'update_pdone_birth_place_payload.g.dart';

@freezed
class UpdatePDoneBirthPlacePayload with _$UpdatePDoneBirthPlacePayload {
  const factory UpdatePDoneBirthPlacePayload({
    String? countryName,
    String? provinceName,
    String? districtName,
    String? wardName,
    String? street,
    String? address,
    String? countryCode,
    String? countryId,
    String? provinceId,
    String? districtId,
    String? wardId,
  }) = _UpdatePDoneBirthPlacePayload;

  factory UpdatePDoneBirthPlacePayload.fromJson(Map<String, dynamic> json) =>
      _$UpdatePDoneBirthPlacePayloadFromJson(json);
}