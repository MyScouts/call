// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_pdone_response.freezed.dart';
part 'register_pdone_response.g.dart';

@freezed
class RegisterPDoneResponse with _$RegisterPDoneResponse {
  const factory RegisterPDoneResponse({
    required String token,
    String? phone,
    String? email,
    String? phoneCode,
  }) = _RegisterPDoneResponse;

  factory RegisterPDoneResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterPDoneResponseFromJson(json);
}
