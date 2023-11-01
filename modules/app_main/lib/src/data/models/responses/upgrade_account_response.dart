// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upgrade_account_response.freezed.dart';
part 'upgrade_account_response.g.dart';

@freezed
class UpgradeAccountResponse with _$UpgradeAccountResponse {
  const factory UpgradeAccountResponse({
    required String token,
    String? phone,
    String? phoneCode,
  }) = _UpgradeAccountResponse;

  factory UpgradeAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UpgradeAccountResponseFromJson(json);
}
