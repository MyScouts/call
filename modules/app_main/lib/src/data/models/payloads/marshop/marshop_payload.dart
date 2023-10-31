import 'package:json_annotation/json_annotation.dart';

part 'marshop_payload.g.dart';

@JsonSerializable()
class RegisterCustomerPayload {
  final int marshopId;

  const RegisterCustomerPayload({
    required this.marshopId,
  });

  factory RegisterCustomerPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterCustomerPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCustomerPayloadToJson(this);
}
