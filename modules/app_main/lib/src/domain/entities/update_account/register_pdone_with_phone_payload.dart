// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_pdone_with_phone_payload.freezed.dart';
part 'register_pdone_with_phone_payload.g.dart';

@freezed
class RegisterPDoneAccountPayload with _$RegisterPDoneAccountPayload {
  const factory RegisterPDoneAccountPayload({
    @JsonKey(includeIfNull: false) String? phoneNumber,
    @JsonKey(includeIfNull: false) String? phoneCode,
    @JsonKey(name: 'country_id', includeIfNull: false) int? countryId,
    @JsonKey(includeIfNull: false) String? email,
  }) = _RegisterPDoneAccountPayload;

  factory RegisterPDoneAccountPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterPDoneAccountPayloadFromJson(json);
}
