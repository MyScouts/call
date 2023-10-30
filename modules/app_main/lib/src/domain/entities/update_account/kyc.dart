// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc.freezed.dart';
part 'kyc.g.dart';

@freezed
class Kyc with _$Kyc {
  const factory Kyc({
    int? id,
    int? userId,
    int? status,
    String? kycPassport,
    String? kycIdentityFront,
    String? kycIdentityBack,
    String? portrait,
  }) = _Kyc;

  factory Kyc.fromJson(Map<String, dynamic> json) => _$KycFromJson(json);
}
