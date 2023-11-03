// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp.freezed.dart';

part 'otp.g.dart';

@freezed
class Otp with _$Otp {
  const factory Otp({
    String? token,
    String? phone,
    String? phoneCode,
  }) = _Otp;

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);
}
