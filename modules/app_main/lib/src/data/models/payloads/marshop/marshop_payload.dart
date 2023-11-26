import 'package:json_annotation/json_annotation.dart';

part 'marshop_payload.g.dart';

@JsonSerializable()
class RegisterCustomerPayload {
  final String otp;
  final String marshopId;

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
  @JsonKey(includeIfNull: false)
  String? referralId;

  RegisterMarshopPayload({
    required this.name,
    this.referralId,
    required this.otp,
  });

  factory RegisterMarshopPayload.fromJson(Map<String, dynamic> json) =>
      _$RegisterMarshopPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterMarshopPayloadToJson(this);
}
