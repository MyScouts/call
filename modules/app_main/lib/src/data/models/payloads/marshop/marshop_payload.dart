import 'package:json_annotation/json_annotation.dart';

part 'marshop_payload.g.dart';

@JsonSerializable()
class RegisterCustomerPayload {
  final String otp;
  final int marshopId;

  const RegisterCustomerPayload({
    required this.marshopId,
    required this.otp,
  });

  factory RegisterCustomerPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterCustomerPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCustomerPayloadToJson(this);
}

@JsonSerializable()
class RegisterMarshopPayload {
  final String otp;
  final String name;
  final int referralId;

  const RegisterMarshopPayload({
    required this.name,
    required this.referralId,
    required this.otp,
  });

  factory RegisterMarshopPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterMarshopPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMarshopPayloadToJson(this);
}
