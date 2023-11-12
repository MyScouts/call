import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdone_verify_otp_protector.g.dart';

@JsonSerializable()
class PDoneVerifyOTPProtectorRequest {
  String? requestId;
  String? otp;

  PDoneVerifyOTPProtectorRequest({
    this.requestId,
    this.otp
  });

  factory PDoneVerifyOTPProtectorRequest.fromJson(Map<String, dynamic> json) =>
      _$PDoneVerifyOTPProtectorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PDoneVerifyOTPProtectorRequestToJson(this);
}
