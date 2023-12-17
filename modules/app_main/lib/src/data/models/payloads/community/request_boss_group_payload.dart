import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_boss_group_payload.g.dart';

@JsonSerializable()
class RequestBossGroupPayload {
  final String otp;

  RequestBossGroupPayload({required this.otp});

  factory RequestBossGroupPayload.fromJson(Map<String, dynamic> json) =>
      _$RequestBossGroupPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RequestBossGroupPayloadToJson(this);
}
