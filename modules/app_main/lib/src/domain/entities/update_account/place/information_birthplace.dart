import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_birthplace.freezed.dart';
part 'information_birthplace.g.dart';

@freezed
class InformationPDoneBirthPlace with _$InformationPDoneBirthPlace {
  const factory InformationPDoneBirthPlace({
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
  }) = _InformationPDoneBirthPlace;

  factory InformationPDoneBirthPlace.fromJson(Map<String, dynamic> json) =>
      _$InformationPDoneBirthPlaceFromJson(json);
}
