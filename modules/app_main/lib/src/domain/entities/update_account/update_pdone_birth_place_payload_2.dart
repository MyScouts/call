import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_pdone_birth_place_payload_2.freezed.dart';
part 'update_pdone_birth_place_payload_2.g.dart';

@freezed
class UpdatePDoneBirthPlacePayload2 with _$UpdatePDoneBirthPlacePayload2 {
  const factory UpdatePDoneBirthPlacePayload2({
    String? countryName,
    String? provinceName,
    String? districtName,
    String? wardName,
    String? street,
    String? address,
    String? countryCode,
    int? countryId,
    int? provinceId,
    int? districtId,
    int? wardId,
  }) = _UpdatePDoneBirthPlacePayload2;

  factory UpdatePDoneBirthPlacePayload2.fromJson(Map<String, dynamic> json) =>
      _$UpdatePDoneBirthPlacePayload2FromJson(json);
}