// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_place_information_payload.freezed.dart';
part 'update_place_information_payload.g.dart';

@freezed
class UpdatePlaceInformationPayload with _$UpdatePlaceInformationPayload {
  const factory UpdatePlaceInformationPayload({
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
  }) = _UpdatePlaceInformationPayload;

  factory UpdatePlaceInformationPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdatePlaceInformationPayloadFromJson(json);
}
