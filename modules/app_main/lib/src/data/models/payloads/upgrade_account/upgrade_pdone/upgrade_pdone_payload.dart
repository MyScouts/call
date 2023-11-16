import 'package:freezed_annotation/freezed_annotation.dart';

part 'upgrade_pdone_payload.g.dart';

@JsonSerializable()
class UpgradePDonePayload {
  final String otp;
  const UpgradePDonePayload({
    required this.otp,
  });

  factory UpgradePDonePayload.fromJson(Map<String, dynamic> json) =>
      _$UpgradePDonePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradePDonePayloadToJson(this);
}
