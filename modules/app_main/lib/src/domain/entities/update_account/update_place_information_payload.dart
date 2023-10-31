// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_place_information_payload.freezed.dart';
part 'update_place_information_payload.g.dart';

@freezed
class UpdatePlaceInformationPayload with _$UpdatePlaceInformationPayload {
  const factory UpdatePlaceInformationPayload({
    String? country,
    int? province,
    String? district,
    int? ward,
    String? address,
  }) = _UpdatePlaceInformationPayload;

  factory UpdatePlaceInformationPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdatePlaceInformationPayloadFromJson(json);
}
