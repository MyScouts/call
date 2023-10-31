// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_pdone_kyc_payload.freezed.dart';
part 'update_pdone_kyc_payload.g.dart';

@freezed
class UpdatePDoneKYCPayload with _$UpdatePDoneKYCPayload {
  @JsonSerializable(explicitToJson: true)
  const factory UpdatePDoneKYCPayload({
    String? kycPassport,
    String? kycIdentityFront,
    String? kycIdentityBack,
    required String portrait,
  }) = _UpdatePDoneKYCPayload;

  factory UpdatePDoneKYCPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdatePDoneKYCPayloadFromJson(json);
}
