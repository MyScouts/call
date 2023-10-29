// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_status.freezed.dart';
part 'kyc_status.g.dart';

@freezed
class KycStatus with _$KycStatus {
  const factory KycStatus({
    required int currentStep,
  }) = _KycStatus;

  factory KycStatus.fromJson(Map<String, dynamic> json) =>
      _$KycStatusFromJson(json);
}
