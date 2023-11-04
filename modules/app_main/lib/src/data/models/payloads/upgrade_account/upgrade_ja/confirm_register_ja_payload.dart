import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_register_ja_payload.g.dart';

@JsonSerializable()
class ConfirmRegisterJAPayload {
  final bool isConfirmed;

  ConfirmRegisterJAPayload({
    required this.isConfirmed,
  });

  factory ConfirmRegisterJAPayload.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRegisterJAPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmRegisterJAPayloadToJson(this);
}
