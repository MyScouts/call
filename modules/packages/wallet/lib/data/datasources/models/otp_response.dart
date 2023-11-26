import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/otp/otp.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  @JsonKey(name: 'token', includeIfNull: false)
  final Otp otp;

  OtpResponse({required this.otp});

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);
}
