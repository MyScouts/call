import 'package:freezed_annotation/freezed_annotation.dart';

part 'information_currentplace.freezed.dart';
part 'information_currentplace.g.dart';

@freezed
class InformationDPoneCurrentPlace with _$InformationDPoneCurrentPlace {
  const factory InformationDPoneCurrentPlace({
      String? countryName,
    String? provinceName,
    String? districtName,
    String? wardName,
    String? street,
    String? address,
    String? countryCode,
    String? provinceCode,
    String? districtCode,
    String? wardCode,
  }) = _InformationDPoneCurrentPlace;

  factory InformationDPoneCurrentPlace.fromJson(Map<String, dynamic> json) =>
      _$InformationDPoneCurrentPlaceFromJson(json);
}
