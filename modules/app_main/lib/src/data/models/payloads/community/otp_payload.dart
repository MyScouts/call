import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_payload.g.dart';

@JsonSerializable()
class OtpPayload {
  final String type;

  OtpPayload({required this.type});

  factory OtpPayload.fromJson(Map<String, dynamic> json) =>
      _$OtpPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$OtpPayloadToJson(this);
}
