import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_request.g.dart';

@JsonSerializable()
class WithdrawRequest {
  final int bankAccountId;
  final num value;
  final String otp;

  WithdrawRequest({
    required this.value,
    required this.bankAccountId,
    required this.otp,
  });

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawRequestToJson(this);
}
